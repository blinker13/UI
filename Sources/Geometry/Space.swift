
public struct Space : GeometryType {

	public static let zero:Space = 0.0

	// MARK: -
	
	public var top:Unit
	public var right:Unit
	public var bottom:Unit
	public var left:Unit

	// MARK: -

	public init(top:Unit = 0.0, right:Unit = 0.0, bottom:Unit = 0.0, left:Unit = 0.0) {
		(self.top, self.left, self.bottom, self.right) = (top, left, bottom, right)
	}

	public init(horizontal:Unit, vertical:Unit) {
		self.init(top:vertical, right:horizontal, bottom:vertical, left:horizontal)
	}

	public init(horizontal:Unit) {
		self.init(right:horizontal, left:horizontal)
	}

	public init(vertical:Unit) {
		self.init(top:vertical, bottom:vertical)
	}

	public init(floatLiteral value:Unit) {
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
