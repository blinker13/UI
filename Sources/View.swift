
public struct View : Component, Stylable, Visual {

	public let renderer:(Context) -> [Component]
	public let style:Style

	public init (style:Style, renderer:@escaping (Context) -> [Component]) {
		self.renderer = renderer
		self.style = style
	}

	public init (style:Style, _ components:@autoclosure @escaping (Context) -> [Component]) {
		self.renderer = components
		self.style = style
	}

	public init (style:Style, _ components:Component ...) {
		self.renderer = { _ in return components }
		self.style = style
	}

	public func render(with context:Context) -> [Component] {
		return renderer(context)
	}
}
