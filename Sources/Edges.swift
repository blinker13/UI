
public struct Edges : Geometry {
	public var leading:Unit
	public var trailing:Unit
}

// MARK: -

public extension Edges {
	var total:Unit { return leading + trailing }
}

// MARK: -

extension Edges : CustomStringConvertible {
	public var description:String {
		return "Edges(leading:\(leading), trailing:\(trailing))"
	}
}

// MARK: -

extension Edges : FloatLiteralConvertible {
	public init(floatLiteral value:Unit) {
		(self.leading, self.trailing) = (value, value)
	}
}

// MARK: -

extension Edges : Transformable {
	public func transformed(_ transform:Transform) -> Edges {
		// TODO: implementation
		return self
	}
}

// MARK: -

public func == (left:Edges, right:Edges) -> Bool {
	return left.leading == right.leading && left.trailing == right.trailing
}
