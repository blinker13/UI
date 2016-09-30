
import Geometry

internal struct SizeCalculator {

	fileprivate let container:ContainerLayout
	fileprivate let layouts:[ComponentLayout]
	fileprivate let remainder:Real

	fileprivate var iterator:StrideToIterator<Int>

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
			let isReversed = container.alignment == .trailing
			let sequence = FlexibleLayoutEnumerator(flexIndexes, layouts, reversed:isReversed)
			remainder = container.distribution.calculation(sequence, remainder) { index, flex in
				layouts[index].main.length += flex
			}
		}

		let strideTo = stride(from:layouts.startIndex, to:layouts.endIndex, by:1)

		self.iterator = strideTo.makeIterator()
		self.container = container
		self.remainder = remainder
		self.layouts = layouts
	}
}

internal extension SizeCalculator {
	var count:Int { return layouts.count }
	var offset:Real { return container.main.edges.leading - container.alignment.calculateOffset(with:remainder) }
}

extension SizeCalculator : IteratorProtocol {
	internal mutating func next() -> (Int, ComponentLayout)? {
		guard let index = iterator.next() else { return nil }
		let layout = layouts[index]
		return (index, layout)
	}
}
