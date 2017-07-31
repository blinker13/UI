
public struct Edges : Geometry {

	public var leading:Float
	public var trailing:Float

	public init (leading:Float, trailing:Float) {
		(self.leading, self.trailing) = (leading, trailing)
	}
}

public extension Edges {
	static var infinity = Edges(leading:.infinity, trailing:.infinity)
	var total:Float { return leading + trailing }
}

extension Edges : CustomStringConvertible {
	public var description:String {
		return "\(leading) |---| \(trailing)"
	}
}

extension Edges : Equatable {
	public static func == (left:Edges, right:Edges) -> Bool {
		return left.leading == right.leading && left.trailing == right.trailing
	}
}

extension Edges : ExpressibleByFloatLiteral {
	public init (floatLiteral value:Float) {
		(self.leading, self.trailing) = (value, value)
	}
}
