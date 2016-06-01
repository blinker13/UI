
public struct Space : Geometry {
	
	public var top:Unit
	public var left:Unit
	public var bottom:Unit
	public var right:Unit

	public init(top:Unit = 0, left:Unit = 0, bottom:Unit = 0, right:Unit = 0) {
		(self.top, self.left, self.bottom, self.right) = (top, left, bottom, right)
	}
}

// MARK: -

public extension Space {
	init(horizontal:Unit, vertical:Unit) { self.init(top:vertical, left:horizontal, bottom:vertical, right:horizontal) }
	init(horizontal:Unit) { self.init(left:horizontal, right:horizontal) }
	init(vertical:Unit) { self.init(top:vertical, bottom:vertical) }
}

// MARK: -

extension Space : AlignmentRepresentable {
	public var leading:Point { return Point(left, top) }
	public var center:Point { return Point(left + right, top + bottom) }
	public var trailing:Point { return Point(right, bottom) }
}

// MARK: -

extension Space : ArrangementRepresentable {
	public var horizontal:Edges { return Edges(leading:left, trailing:right) }
	public var vertical:Edges { return Edges(leading:top, trailing:bottom) }
}

// MARK: -

extension Space : CustomStringConvertible {
	public var description:String {
		return "Space(top:\(top), left:\(left), bottom:\(bottom), right:\(right))"
	}
}

// MARK: -

extension Space : FloatLiteralConvertible {
	public init(floatLiteral value:Unit) {
		self.init(top:value, left:value, bottom:value, right:value)
	}
}

// MARK: -

extension Space : Transformable {
	public func transformed(transform:Transform) -> Space {
		// TODO: implementation
		return self
	}
}

// MARK: -

public func == (left:Space, right:Space) -> Bool {
	return left.top == right.top && left.left == right.left && left.bottom == right.bottom && left.right == right.right
}
