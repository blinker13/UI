
public struct View : Component, Stylable, Visual {

//	public let renderer:(Context) -> [Component]
	public let renderer:() -> [Component]
	public let style:Style

//	public init (style:Style, renderer:@escaping (Context) -> [Component]) {
	public init (style:Style, renderer:@escaping () -> [Component]) {
		self.renderer = renderer
		self.style = style
	}

//	public init (style:Style, _ components:@autoclosure @escaping (Context) -> [Component]) {
	public init (style:Style, _ components:@autoclosure @escaping () -> [Component]) {
		self.renderer = components
		self.style = style
	}

	public init (style:Style, _ components:Component ...) {
//		self.renderer = { _ in return components }
		self.renderer = { return components }
		self.style = style
	}

//	public func render(with context:Context) -> [Component] {
//		return renderer(context)
//	}

	public func render() -> [Component] {
		return renderer()
	}
}
