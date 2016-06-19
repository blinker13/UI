
import Canvas

internal struct LayoutCalculator {

	private let container:ContainerLayout
	private var layouts:SizeCalculator
	private var offset:Real

	internal init(_ container:ContainerLayout) {
		let layouts = SizeCalculator(container)
		self.offset = layouts.offset
		self.container = container
		self.layouts = layouts
	}
}

internal extension LayoutCalculator {

	var count:Int { return layouts.count }

	init?(_ node:Node) {
		guard let container = node.component as? Container else { return nil }
		let layout = ContainerLayout(container, node.frame.size)
		self.init(layout)
	}
}

extension LayoutCalculator : IteratorProtocol, Sequence {
	internal mutating func next() -> (Int, Component, Rectangle)? {
		guard let (index, layout) = layouts.next() else { return nil }
		defer { offset += layout.main.length + layout.main.edges.trailing }
		offset += layout.main.edges.leading

		let crossRemainder = container.cross.constraint - layout.cross.edges.total - layout.cross.length
		let crossPosition = container.cross.edges.leading + layout.cross.calculatePosition(with:crossRemainder)
		let position = Point(values:[container.main.arrangement:offset, container.cross.arrangement:crossPosition])
		let rect = Rectangle(origin:position, size:layout.size)

		return (index, layout.component, rect)
	}
}
