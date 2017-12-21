
public struct View : Element {

	public let content:[Element]
	public let style:Style

	public init (style:Style, elements:[Element]) {
		self.content = elements
		self.style = style
	}

	public init (style:Style, _ elements:Element ...) {
		self.content = elements
		self.style = style
	}

	public init (style:Style, renderer:() -> [Element]) {
		self.content = renderer()
		self.style = style
	}
}
