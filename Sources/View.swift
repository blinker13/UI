
public struct View : Container, Visual {

	public let constructor:() -> [Component]
	public let style:Style

	// MARK: -

	public init(style:Style, constructor:() -> [Component]) {
		(self.constructor, self.style) = (constructor, style)
	}
}

// MARK: -

extension View {
	public init(style:Style, _ components:Component ...) {
		self.init(style:style) { return components }
	}

	public func construct() -> [Component] {
		return constructor()
	}
}
