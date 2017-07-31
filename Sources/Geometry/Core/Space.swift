
public typealias Inset = Space
public typealias Margin = Space
public typealias Padding = Space

public struct Space : Geometry {

	public var top:Float
	public var right:Float
	public var bottom:Float
	public var left:Float

	public init (top:Float = 0, right:Float = 0, bottom:Float = 0, left:Float = 0) {
		(self.top, self.right, self.bottom, self.left) = (top, right, bottom, left)
	}
}

public extension Space {

	init (horizontal:Float, vertical:Float) {
		self.init(top:vertical, right:horizontal, bottom:vertical, left:horizontal)
	}

	init (horizontal:Float) {
		self.init(right:horizontal, left:horizontal)
	}

	init (vertical:Float) {
		self.init(top:vertical, bottom:vertical)
	}
}

extension Space : CustomStringConvertible {
	public var description:String {
		return "top:\(top), right:\(right), bottom:\(bottom), left:\(left)"
	}
}

extension Space : Equatable {
	public static func == (left:Space, right:Space) -> Bool {
		return left.top == right.top && left.right == right.right && left.bottom == right.bottom && left.left == right.left
	}
}

extension Space : ExpressibleByFloatLiteral {
	public init (floatLiteral value:Float) {
		self.init(top:value, right:value, bottom:value, left:value)
	}
}
