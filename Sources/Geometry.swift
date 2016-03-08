
public protocol Geometry {
	func transformed(transform:Transform) -> Self
}

// MARK: -

extension Geometry {

	public final func rotated(angle:Unit) -> Self {
		let transform = Transform(rotated:angle)
		return transformed(transform)
	}

	public final func scaled(width:Unit, height:Unit) -> Self {
		let transform = Transform(scaled:width, height)
		return transformed(transform)
	}

	public final func translated(x:Unit, y:Unit) -> Self {
		let transform = Transform(translated:x, y)
		return transformed(transform)
	}
}

// MARK: -

extension Geometry where Self : FloatLiteralConvertible {
	public final static var infinity:Self { return .infinity }
	public final static var zero:Self { return 0.0 }
}

// MARK: -

extension Geometry where Self : FloatLiteralConvertible, Self : Equatable {
	public final var isFinite:Bool { return self != Self.infinity }
	public final var isInfinite:Bool { return self == Self.infinity }
	public final var isZero:Bool { return self == Self.zero }
}
