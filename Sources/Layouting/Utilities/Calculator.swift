
import Geometry

internal typealias Flexible = (size:Float, index:Int)

public final class Calculator : Sequence {

	public typealias Result = AnyIterator<Rect>

	private let container:Container
	private let items:[Item]
	private let box:Layout

	public init (container:Container, items:[Item], in rect:Rect) {
		self.box = Layout(container:container, in:rect)
		self.container = container
		self.items = items
	}
}

// MARK: -

public extension Calculator {

	func makeIterator() -> Result {
		var layouts = items.map(precalculateLayout)
		var remainder = layouts.reduce(box.main.size, calculate)

//		while remainder > 0 {
//			let enumerator = layouts.enumerated()
//			let flexibles = enumerator.flatMap(indexForFlexibleMain)
//			if flexibles.isEmpty { break }
//
//			remainder = container.distribute()
//		}

		var offset = box.justify(remainder)
		var iterator = layouts.makeIterator()

		return Result() {
			guard var layout = iterator.next() else { return nil }
			layout.cross.start = layout.cross.axis.leading + layout.justify(self.box)
			layout.main.start = offset + layout.main.axis.leading
			defer { offset += layout.main.length }
			return self.container.convert(layout)
		}
	}
}

// MARK: -

private extension Calculator {

	func calculate(remains:Float, layout:Layout) -> Float {
		return remains - layout.main.length
	}

	func precalculateLayout(for item:Item) -> Layout {
		let cross = precalculateCross(for:item)
		let main = precalculateMain(for:item)
		return Layout(align:item.alignment, cross:cross, main:main)
	}

	func precalculateMain(for item:Item) -> Dimension {
		let axis = item.margin[container.arrangement]
		let size = item[container.arrangement]
		return Dimension(size:size, axis:axis)
	}

	func precalculateCross(for item:Item) -> Dimension {
		let crossSizes = item[container.arrangement.flipped]
		let axis = item.margin[container.arrangement.flipped]
		let estimate = Swift.min(crossSizes.end, box.cross.size - axis.total)
		let size = Axis(floatLiteral:Swift.max(crossSizes.start, estimate))
		return Dimension(size:size, axis:axis)
	}

	func indexForFlexibleMain(index:Int, layout:Layout) -> Flexible? {
		return layout.main.isFlexible ? (layout.main.size, index) : nil
	}
}
