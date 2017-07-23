
public struct Canvas : Stylable, Surface {

	public let compose:(Rect) -> Composition
	public let style:Style

	public init (style:Style, compose:@escaping(Rect) -> Composition) {
		self.compose = compose
		self.style = style
	}

	public func draw(in rect:Rect) -> Composition {
		return compose(rect)
	}
}
