
public struct View : Container, Visual {

	public let constructor:() -> [Component]
	public let style:Style

	public init(style:Style, constructor:() -> [Component]) {
		(self.constructor, self.style) = (constructor, style)
	}
}

// MARK: -

public extension View {

	init(style:Style, _ components:Component ...) {
		self.init(style:style) { return components }
	}

	func construct() -> [Component] {
		return constructor()
	}
}
