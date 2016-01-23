
public struct Size : Geometry {

	public static let zero:Size = 0.0

	// MARK: -

	public var min:Unit
	public var max:Unit

	// MARK: -

	public init(min:Unit = 0.0, max:Unit = .infinity) {
		precondition(min <= max, "Size can not be negative")
		(self.min, self.max) = (min, max)
	}
	
	public init(floatLiteral value:Unit) {
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

public func ... (start:Unit, end:Unit) -> Size {
	return Size(min:start, max:end)
}
