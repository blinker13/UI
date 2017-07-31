
extension Text : Stylable, Drawable, Element {

	public var children:[Element] {
		return []
	}

	public var style: Style {
		switch self {
			case let .compound(compound): return compound.style
			case let .run(run): return run.style
		}
	}

	public func draw(in rect:Rect) -> Composition {
		return .print(self)
	}
}
