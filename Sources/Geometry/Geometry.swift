
public protocol Geometry : Codable {

	static var infinity:Self { get }
	static var zero:Self { get }

	var isFinite:Bool { get }
	var isInfinite:Bool { get }
	var isZero:Bool { get }
}

public extension Geometry where Self : Equatable {
	var isFinite:Bool { return self != Self.infinity }
	var isInfinite:Bool { return self == Self.infinity }
	var isZero:Bool { return self == Self.zero }
}

public extension Geometry where Self : ExpressibleByFloatLiteral {
	static var infinity:Self { return .infinity }
	static var zero:Self { return 0.0 }
}
