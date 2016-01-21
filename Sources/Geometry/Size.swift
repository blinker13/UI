
public struct Size : GeometryType {

	public static let zero:Size = 0.0

	// MARK: -

	public var min:Points
	public var max:Points

	// MARK: -

	public init(min:Points = 0.0, max:Points = .infinity) {
		precondition(min <= max, "Size can not be negative")
		(self.min, self.max) = (min, max)
	}
	
	public init(floatLiteral value:Points) {
		self.init(min:value, max:value)
	}

	// MARK: -

	public var description:String {
		return "Size(min:\(min), max:\(max))"
	}
}

// MARK: -

public func == (left:Size, right:Size) -> Bool {
	return (left.min == right.min && left.max == right.max)
}

public func ... (start:Points, end:Points) -> Size {
	return Size(min:start, max:end)
}
