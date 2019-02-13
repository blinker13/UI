
import Runtime

public struct View : Element {
	public let children:[Element]
	public let style:Style
}

// MARK: -

public extension View {

	init (style:Style = .empty, _ children:Element ...) {
		self.children = children
		self.style = style
	}
}
