
public struct Offset : GeometryType, CustomStringConvertible {

	public static let zero = Offset()

	public var top:Points
	public var right:Points
	public var bottom:Points
	public var left:Points

	// MARK: -

	public init(top:Points = 0.0, right:Points = 0.0, bottom:Points = 0.0, left:Points = 0.0) {
		(self.top, self.left, self.bottom, self.right) = (top, left, bottom, right)
	}

	public init(horizontal:Points, vertical:Points) {
		self.init(top:vertical, right:horizontal, bottom:vertical, left:horizontal)
	}

	public init(horizontal:Points) {
		self.init(right:horizontal, left:horizontal)
	}

	public init(vertical:Points) {
		self.init(top:vertical, bottom:vertical)
	}

	public init(floatLiteral value:Points) {
		self.init(top:value, right:value, bottom:value, left:value)
	}

	// MARK: - CustomStringConvertible

	public var description:String {
		return "Offset(top:\(top), right:\(right), bottom:\(bottom), left:\(left))"
	}
}

// MARK: - Operators

public func == (left:Offset, right:Offset) -> Bool {
	return (left.top == right.top && left.left == right.left && left.bottom == right.bottom && left.right == right.right)
}
