
public struct Space : GeometryType {

	public static let zero:Space = 0.0

	// MARK: -
	
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

	// MARK: -

	public var description:String {
		return "Space(top:\(top), right:\(right), bottom:\(bottom), left:\(left))"
	}
}

// MARK: -

public func == (left:Space, right:Space) -> Bool {
	return (left.top == right.top && left.left == right.left && left.bottom == right.bottom && left.right == right.right)
}
