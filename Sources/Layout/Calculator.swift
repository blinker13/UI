
public final class Calculator {

	private let container:Container
	private let distribute:(Float, Float) -> Float
	private var factor:Float = 0.0
	private var offset:Float = 0.0
	private var box:Layout

	public init (container:Container, in rect:Rect) {
		let bounds = rect.inseted(container.padding)

		let box = Layout(align:container.justify)
		box.main.sizes = Axis(floatLiteral:bounds.size[container.arrangement])
		box.main.axis = container.padding[container.arrangement]
		box.cross.sizes = Axis(floatLiteral:bounds.size[container.arrangement.flipped])
		box.cross.axis = container.padding[container.arrangement.flipped]

		self.distribute = container.distribution.calculate
		self.container = container
		self.box = box
	}
}

// MARK: -

public extension Calculator {

	func layout(_ items:[Item]) -> [Rect] {
		let layouts = items.map(prepare)

		while remainder > 0 {
			var flexibles = layouts.filter(flexibleLayouts)
			if flexibles.isEmpty { break }

			if justify == .trailing { flexibles = flexibles.reversed() }
			factor = distribution.determineFactor(for:flexibles)
			remainder = flexibles.reduce(remainder, distribute)
			offset = remainder * justify.factor + box.main[justify]
		}

		return layouts.map(finalize)
	}
}

// MARK: -

private extension Calculator {

	var remainder:Float {
		get { return box.main.size }
		set { box.main.sizes.start = newValue }
	}

	var arrangement:Arrangement { return container.arrangement }
	var distribution:Distribution { return container.distribution }
	var justify:Alignment { return container.justify }
	var padding:Padding { return container.padding }

	func prepare(item:Item) -> Layout {
		let layout = Layout(align:item.alignment)

		layout.main.sizes = item[arrangement]
		layout.main.axis = item.margin[arrangement]
		layout.cross.sizes = item[arrangement.flipped]
		layout.cross.axis = item.margin[arrangement.flipped]

		let boundary = box.cross.size - layout.cross.axis.total
		let minimum = Swift.min(layout.cross.sizes.end, boundary)
		let estimation = Swift.max(layout.cross.sizes.start, minimum)
		layout.cross.sizes = Axis(floatLiteral:estimation)

		remainder -= layout.main.length
		return layout
	}

	func flexibleLayouts(layout:Layout) -> Bool {
		return layout.main.isFlexible
	}

	func distribute(remains:Float, layout:Layout) -> Float {
		let difference = layout.main.sizes.difference
		let size = remainder * distribute(layout.main.size, factor)
		let minimum = Swift.min(size, difference, remains)
		let result = Swift.max(minimum, 1.0).rounded()
		layout.main.sizes.start += result
		return remains - result
	}

	func finalize(layout:Layout) -> Rect {
		defer { offset += layout.main.length }
		layout.cross.start = layout.cross.axis.leading + layout.justify(box)
		layout.main.start = offset + layout.main.axis.leading

		let x = layout[keyPath:arrangement.layoutKey]
		let y = layout[keyPath:arrangement.flipped.layoutKey]
		return Rect(x.start, y.start, x.size, y.size)
	}
}
