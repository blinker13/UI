
public struct Edges : Geometry {

	public var leading:Unit
	public var trailing:Unit

	// MARK: -

	public init(_ leading:Unit = 0, _ trailing:Unit = 0) {
		(self.leading, self.trailing) = (leading, trailing)
	}
}

// MARK: -

extension Edges {

	public var total:Unit { return leading + trailing }

	public func transformed(transform:Transform) -> Edges {
		return self // TODO: implementation
	}
}

// MARK: - CustomStringConvertible

extension Edges : CustomStringConvertible {
	public var description:String {
		return "Edges(leading:\(leading), trailing:\(trailing))"
	}
}

// MARK: - FloatLiteralConvertible

extension Edges : FloatLiteralConvertible {
	public init(floatLiteral value:Unit) {
		self.init(value, value)
	}
}

// MARK: -

public func == (left:Edges, right:Edges) -> Bool {
	return left.leading == right.leading && left.trailing == right.trailing
}
