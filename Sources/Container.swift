
public struct Container : Stylable, View {

	public let renderer:() -> [Component]
	public let style:Style

	public init (style:Style, renderer:@escaping() -> [Component]) {
		self.renderer = renderer
		self.style = style
	}

	public init (style:Style, _ components:@autoclosure @escaping() -> [Component]) {
		self.renderer = components
		self.style = style
	}

	public init (style:Style, _ components:Component ...) {
		self.renderer = { return components }
		self.style = style
	}

	public func render() -> [Component] {
		return renderer()
	}
}
