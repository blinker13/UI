
public protocol Arithmetic {
	func added(_ value:Self) -> Self
	func subtracted(_ value:Self) -> Self
	func multiplied(by value:Self) -> Self
	func divided(by value:Self) -> Self
}

public extension Arithmetic {

	mutating func add(_ value:Self) {
		self = added(value)
	}

	mutating func subtract(_ value:Self) {
		self = subtracted(value)
	}

	mutating func multiply(by value:Self) {
		self = multiplied(by:value)
	}

	mutating func divid(by value:Self) {
		self = divided(by:value)
	}
}

public extension Arithmetic {

	public static func + (left:Self, right:Self) -> Self {
		return left.added(right)
	}

	public static func - (left:Self, right:Self) -> Self {
		return left.subtracted(right)
	}

	public static func * (left:Self, right:Self) -> Self {
		return left.multiplied(by:right)
	}

	public static func / (left:Self, right:Self) -> Self {
		return left.divided(by:right)
	}
}
