
public struct View : Component, Stylable, Visual {

	public let constructor:(Context) -> [Component]
	public let style:Style

	public init (style:Style, constructor:@escaping (Context) -> [Component]) {
		self.constructor = constructor
		self.style = style
	}

	public init (style:Style, _ components:@autoclosure @escaping (Context) -> [Component]) {
		self.constructor = components
		self.style = style
	}

	public init (style:Style, _ components:Component ...) {
		self.constructor = { _ in return components }
		self.style = style
	}

	public func construct(with context:Context) -> [Component] {
		return constructor(context)
	}
}
