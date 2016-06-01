
public struct Dimension : Geometry {

	public var min:Unit
	public var max:Unit

	public init(min:Unit = 0, max:Unit = .infinity) {
		precondition(min <= max, "Dimension can not be negative")
		(self.min, self.max) = (min, max)
	}
}

// MARK: -

public extension Dimension {
	var difference:Unit { return max - min }
	var isFlexible:Bool { return min < max }
}

// MARK: -

extension Dimension : CustomStringConvertible {
	public var description:String {
		return "Dimension(min:\(min), max:\(max))"
	}
}

// MARK: -

extension Dimension : FloatLiteralConvertible {
	public init(floatLiteral value:Unit) {
		self.init(min:value, max:value)
	}
}

// MARK: -

extension Dimension : Transformable {
	public func transformed(transform:Transform) -> Dimension {
		// TODO: implementation
		return self
	}
}

// MARK: -

public func == (left:Dimension, right:Dimension) -> Bool {
	return left.min == right.min && left.max == right.max
}

public func ... (start:Unit, end:Unit) -> Dimension {
	return Dimension(min:start, max:end)
}
