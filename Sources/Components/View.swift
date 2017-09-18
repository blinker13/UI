
public struct View : Stylable, Viewable, Element {

	public let renderer:() -> [Element]
	public let style:Style

	public var children:[Element] {
		return renderer()
	}

	public init (style:Style, renderer:@escaping () -> [Element]) {
		self.renderer = renderer
		self.style = style
	}

	public init (style:Style, elements:@autoclosure @escaping () -> [Element]) {
		self.renderer = elements
		self.style = style
	}

	public init (style:Style, _ elements:Element ...) {
		self.renderer = { return elements }
		self.style = style
	}
}
