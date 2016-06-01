
internal struct SizeCalculator {

	private let container:ContainerLayout
	private let layouts:[ComponentLayout]
	private let remainder:Unit

	private var iterator:StrideToGenerator<Int>

	internal init(_ container:ContainerLayout) {

		var flexIndexes = [Int]()
		var remainder = container.main.constraint

		var layouts = container.components.map { index, component -> ComponentLayout in
			var layout = ComponentLayout(component, container.main.arrangement)
			layout.cross.calculateLength(with:container.cross.constraint)
			if layout.main.isFlexible { flexIndexes.append(index) }
			remainder -= layout.main.total
			return layout
		}

		if !flexIndexes.isEmpty && remainder > 0 {
			let isReversed = container.alignment == .Trailing
			let sequence = FlexibleLayoutEnumerator(flexIndexes, layouts, reversed:isReversed)
			remainder = container.distribution.calculation(sequence, remainder) { index, flex in
				layouts[index].main.length += flex
			}
		}

		let strideTo = layouts.startIndex.stride(to:layouts.endIndex, by:1)

		self.iterator = strideTo.generate()
		self.container = container
		self.remainder = remainder
		self.layouts = layouts
	}
}

// MARK: -

internal extension SizeCalculator {
	var count:Int { return layouts.count }
	var offset:Unit { return container.main.edges.leading - container.alignment.calculateOffset(with:remainder) }
}


// MARK: -

extension SizeCalculator : GeneratorType {
	internal mutating func next() -> (Int, ComponentLayout)? {
		guard let index = iterator.next() else { return nil }
		let layout = layouts[index]
		return (index, layout)
	}
}