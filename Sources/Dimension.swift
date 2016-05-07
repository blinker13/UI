
public struct Dimension : Geometry {

	public var min:Unit
	public var max:Unit

	// MARK: -

	public init(min:Unit = 0, max:Unit = .infinity) {
		precondition(min <= max, "Dimension can not be negative")
		(self.min, self.max) = (min, max)
	}
}

// MARK: -

extension Dimension {

	public var difference:Unit { return max - min }
	public var isFlexible:Bool { return min < max }

	public func transformed(_ transform:Transform) -> Dimension {
		return self // TODO: implementation
	}
}

// MARK: - CustomStringConvertible

extension Dimension : CustomStringConvertible {
	public var description:String {
		return "Dimension(min:\(min), max:\(max))"
	}
}

// MARK: - FloatLiteralConvertible

extension Dimension : FloatLiteralConvertible {
	public init(floatLiteral value:Unit) {
		self.init(min:value, max:value)
	}
}

// MARK: -

public func == (left:Dimension, right:Dimension) -> Bool {
	return left.min == right.min && left.max == right.max
}

public func ... (start:Unit, end:Unit) -> Dimension {
	return Dimension(min:start, max:end)
}
