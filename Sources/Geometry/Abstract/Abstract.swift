
#if arch(i386) || arch(arm)
public typealias Scalar = Float
#elseif arch(x86_64) || arch(arm64) || arch(s390x) || arch(powerpc64) || arch(powerpc64le)
public typealias Scalar = Double
#else
#error("This architecture is not supported")
#endif

// MARK: -

public protocol SIMDRepesentable : ExpressibleByFloatLiteral {

	associatedtype Storage : SIMD where Storage.Scalar == Scalar

	var storage: Storage { get }
	init(_ storage: Storage)
}

// MARK: -

public extension SIMDRepesentable where Self : Arithmetic {

	@inlinable static var zero: Self { .init(.zero) }

	@inlinable static prefix func - (value: Self) -> Self { .init(-value.storage) }

	@inlinable static func + (left: Self, right: Self) -> Self { .init(left.storage + right.storage) }
	@inlinable static func - (left: Self, right: Self) -> Self { .init(left.storage - right.storage) }
	@inlinable static func * (left: Self, right: Self) -> Self { .init(left.storage * right.storage) }
	@inlinable static func / (left: Self, right: Self) -> Self { .init(left.storage / right.storage) }

	@inlinable init(floatLiteral value: Scalar) { self.init(Storage(repeating: value)) }

	@inlinable func rounded(_ rule: FloatingPointRoundingRule = .toNearestOrAwayFromZero) -> Self { .init(storage.rounded(rule)) }
}

// MARK: -

public extension SIMDRepesentable where Self : Codable {

	@inlinable init(from decoder: Decoder) throws {
		let storage = try Storage(from: decoder)
		self.init(storage)
	}

	@inlinable func encode(to encoder: Encoder) throws {
		try storage.encode(to: encoder)
	}
}
