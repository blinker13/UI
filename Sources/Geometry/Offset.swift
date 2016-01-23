
public struct Offset : Geometry {

	public static let zero:Offset = 0.0

	// MARK: -

	public var horizontal:Unit
	public var vertical:Unit

	// MARK: -

	public init(horizontal:Unit = 0.0, vertical:Unit = 0.0) {
		(self.horizontal, self.vertical) = (horizontal, vertical)
	}

	public init(floatLiteral value:Unit) {
		self.init(horizontal:value, vertical:value)
	}

	// MARK: -

	public var description:String {
		return "Offset(horizontal:\(horizontal), vertical:\(vertical))"
	}
}

// MARK: -

public func == (left:Offset, right:Offset) -> Bool {
	return (left.horizontal == right.horizontal && left.vertical == right.vertical)
}
