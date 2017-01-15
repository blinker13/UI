
public struct Dimensions : Geometry {

	public var min:Float
	public var max:Float

	public init (min:Float = 0, max:Float = .infinity) {
		precondition(min <= max, "Dimensions can not be negative")
		(self.min, self.max) = (min, max)
	}
}

public extension Dimensions {

	public static var infinity = Dimensions()

	var isInfinite:Bool { return max.isInfinite }
	var difference:Float { return max - min }
	var isFlexible:Bool { return min < max }
}

extension Dimensions : CustomStringConvertible {
	public var description:String {
		return "\(min) ... \(max)"
	}
}

extension Dimensions : Equatable {
	public static func == (left:Dimensions, right:Dimensions) -> Bool {
		return left.min == right.min && left.max == right.max
	}
}

extension Dimensions : ExpressibleByFloatLiteral {
	public init (floatLiteral value:Float) {
		self.init(min:value, max:value)
	}
}
