
public struct Offset : GeometryType, CustomStringConvertible {

	public static let zero:Offset = 0.0

	// MARK: -

	public var horizontal:Points
	public var vertical:Points

	// MARK: -

	public init(horizontal:Points = 0.0, vertical:Points = 0.0) {
		(self.horizontal, self.vertical) = (horizontal, vertical)
	}

	public init(floatLiteral value:Points) {
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
