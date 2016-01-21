
public protocol GeometryType : Equatable, CustomStringConvertible, FloatLiteralConvertible {
	static var zero:Self { get }
}

// MARK: -

extension GeometryType {
	public var isZero:Bool {
		return self == Self.zero
	}
}
