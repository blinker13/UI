
public protocol Arithmetic : Hashable {

	static var zero: Self { get }

	static prefix func - (value: Self) -> Self

	static func + (left: Self, right: Self) -> Self
	static func - (left: Self, right: Self) -> Self
	static func * (left: Self, right: Self) -> Self
	static func / (left: Self, right: Self) -> Self

	func rounded(_ rule: FloatingPointRoundingRule) -> Self
}

// MARK: -

public extension Array where Element : Arithmetic {

	static func + (left: Self, right: Element) -> Self { left.map { $0 + right } }
	static func - (left: Self, right: Element) -> Self { left.map { $0 + right } }
	static func * (left: Self, right: Element) -> Self { left.map { $0 + right } }
	static func / (left: Self, right: Element) -> Self { left.map { $0 + right } }

	@inlinable func rounded(_ rule: FloatingPointRoundingRule = .toNearestOrAwayFromZero) -> Self {
		map { $0.rounded(rule) }
	}
}
