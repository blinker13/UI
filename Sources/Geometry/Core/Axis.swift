
public struct Axis : Geometry {
	public var start:Float
	public var end:Float
}

public extension Axis {

	static let infinity = Axis(start:0, end:.infinity)

	var difference:Float { return end - start }
	var total:Float { return start + end }

	var leading:Float { return start }
	var trailing:Float { return end }

	var min:Float { return start }
	var max:Float { return end }

	var isInfinite:Bool { return end.isInfinite }
	var isFlexible:Bool { return start < end }

	init (min:Float = 0, max:Float = .infinity) {
		precondition(min <= max, "Can not be negative")
		(self.start, self.end) = (min, max)
	}

	init (from start:Float, to end:Float) {
		self.start = start
		self.end = end
	}
}

internal extension Axis {
	func solve(_ constrain:Float) -> Float {
		let interim = Swift.min(end, constrain)
		return Swift.max(start, interim)
	}
}

extension Axis : CustomStringConvertible {
	public var description:String {
		return "\(start) ... \(end)"
	}
}

extension Axis : Equatable {
	public static func == (left:Axis, right:Axis) -> Bool {
		return left.start == right.start && left.end == right.end
	}
}

extension Axis : ExpressibleByFloatLiteral {
	public init (floatLiteral value:Float) {
		(self.start, self.end) = (value, value)
	}
}
