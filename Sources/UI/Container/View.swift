
import Graphics
import Layout

public protocol Viewable {
	var isVisible:Bool { get }
	var background:Color? { get }
	var border:Border? { get }
	var opacity:Opacity { get }
	var shadow:Shadow? { get }
	var tint:Color? { get }
}

// MARK: -

public extension Viewable {
	var isVisible:Bool { return opacity > 0.01 }
}

// MARK: -

public struct View : Stylable, Element {
	public let children:[Element]
	public let style:Style
}

// MARK: -

public extension View {

	init (style:Style, _ children:Element ...) {
		self.children = children
		self.style = style
	}

	init (style:Style, children:[Element]) {
		self.children = children
		self.style = style
	}

	init (style:Style, block:() -> [Element]) {
		self.children = block()
		self.style = style
	}

	func render() -> View {
		return self
	}
}
