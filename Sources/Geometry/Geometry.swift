
public protocol Geometry : CustomStringConvertible, Equatable, FloatLiteralConvertible {
	static var zero:Self { get }
}

// MARK: -

extension Geometry {
	public var isZero:Bool {
		return self == Self.zero
	}
}
