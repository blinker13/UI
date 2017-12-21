
public typealias Inset = Space
public typealias Margin = Space
public typealias Padding = Space

public struct Space : Geometry {
	public var horizontal:Axis
	public var vertical:Axis
}

public extension Space {

	var top:Float { return vertical.start }
	var right:Float { return horizontal.start }
	var bottom:Float { return vertical.end }
	var left:Float { return horizontal.end }

	init (top:Float = 0, right:Float = 0, bottom:Float = 0, left:Float = 0) {
		self.horizontal = Axis(start:left, end:right)
		self.vertical = Axis(start:top, end:bottom)
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
