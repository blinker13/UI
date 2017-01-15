
public struct Space : Geometry {

	public var top:Float
	public var left:Float
	public var bottom:Float
	public var right:Float

	public init (top:Float = 0, left:Float = 0, bottom:Float = 0, right:Float = 0) {
		(self.top, self.left, self.bottom, self.right) = (top, left, bottom, right)
	}
}

public extension Space {

	init (horizontal:Float, vertical:Float) {
		self.init(top:vertical, left:horizontal, bottom:vertical, right:horizontal)
	}

	init (horizontal:Float) {
		self.init(left:horizontal, right:horizontal)
	}

	init (vertical:Float) {
		self.init(top:vertical, bottom:vertical)
	}
}

extension Space : CustomStringConvertible {
	public var description:String {
		return "top:\(top), left:\(left), bottom:\(bottom), right:\(right)"
	}
}

extension Space : Equatable {
	public static func == (left:Space, right:Space) -> Bool {
		return left.top == right.top && left.left == right.left && left.bottom == right.bottom && left.right == right.right
	}
}

extension Space : ExpressibleByFloatLiteral {
	public init (floatLiteral value:Float) {
		self.init(top:value, left:value, bottom:value, right:value)
	}
}
