
public struct Space : Geometry {
	
	public var top:Unit
	public var left:Unit
	public var bottom:Unit
	public var right:Unit

	// MARK: -

	public init(top:Unit = 0, left:Unit = 0, bottom:Unit = 0, right:Unit = 0) {
		(self.top, self.left, self.bottom, self.right) = (top, left, bottom, right)
	}
}

// MARK: -

extension Space {

	public init(horizontal:Unit, vertical:Unit) {
		self.init(top:vertical, left:horizontal, bottom:vertical, right:horizontal)
	}

	public init(horizontal:Unit) {
		self.init(left:horizontal, right:horizontal)
	}

	public init(vertical:Unit) {
		self.init(top:vertical, bottom:vertical)
	}

	public func transformed(_ transform:Transform) -> Space {
		return Space()
	}
}

// MARK: - AlignmentRepresentable

extension Space : AlignmentRepresentable {
	public var leading:Point { return Point(left, top) }
	public var center:Point { return Point(left + right, top + bottom) }
	public var trailing:Point { return Point(right, bottom) }
}

// MARK: - ArrangementRepresentable

extension Space : ArrangementRepresentable {
	public var horizontal:Edges { return Edges(left, right) }
	public var vertical:Edges { return Edges(top, bottom) }
}

// MARK: - CustomStringConvertible

extension Space : CustomStringConvertible {
	public var description:String {
		return "Space(top:\(top), left:\(left), bottom:\(bottom), right:\(right))"
	}
}

// MARK: - FloatLiteralConvertible

extension Space : FloatLiteralConvertible {
	public init(floatLiteral value:Unit) {
		self.init(top:value, left:value, bottom:value, right:value)
	}
}

// MARK: -

public func == (left:Space, right:Space) -> Bool {
	return left.top == right.top && left.left == right.left && left.bottom == right.bottom && left.right == right.right
}
