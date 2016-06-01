
public protocol Geometry : Equatable {

	static var infinity:Self { get }
	static var zero:Self { get }

	var isFinite:Bool { get }
	var isInfinite:Bool { get }
	var isZero:Bool { get }
}

// MARK: -

public extension Geometry {
	var isFinite:Bool { return self != Self.infinity }
	var isInfinite:Bool { return self == Self.infinity }
	var isZero:Bool { return self == Self.zero }
}

// MARK: -

public extension Geometry where Self : FloatLiteralConvertible {
	static var infinity:Self { return .infinity }
	static var zero:Self { return 0.0 }
}
