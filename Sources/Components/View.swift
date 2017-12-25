
import Graphics

public protocol Viewable {
	var background:Color? { get }
	var border:Border? { get }
	var opacity:Opacity? { get }
	var shadow:Shadow? { get }
	var tint:Color? { get }
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
