
public struct Canvas : Component, Stylable, Visual {

	public let compose:(Rect) -> Composition
	public let style:Style

	public init (style:Style, compose:@escaping(Rect) -> Composition) {
		self.compose = compose
		self.style = style
	}
}

extension Canvas : Surface {

	public func draw(in rect:Rect) -> Composition {
		return compose(rect)
	}
}
