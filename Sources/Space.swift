
public struct Space : Equatable, FloatLiteralConvertible, Geometry {
	
	public let top:Unit
	public let left:Unit
	public let bottom:Unit
	public let right:Unit

	// MARK: -

	public init(top:Unit = 0.0, left:Unit = 0.0, bottom:Unit = 0.0, right:Unit = 0.0) {
		(self.top, self.left, self.bottom, self.right) = (top, left, bottom, right)
	}

	public init(horizontal:Unit, vertical:Unit) {
		self.init(top:vertical, left:horizontal, bottom:vertical, right:horizontal)
	}

	public init(horizontal:Unit) {
		self.init(left:horizontal, right:horizontal)
	}

	public init(vertical:Unit) {
		self.init(top:vertical, bottom:vertical)
	}

	public init(floatLiteral value:Unit) {
		self.init(top:value, left:value, bottom:value, right:value)
	}

	// MARK: -

	public func transformed(transform:Transform) -> Space {
		return Space()
	}
}

// MARK: - CustomStringConvertible

extension Space : CustomStringConvertible {
	public var description:String {
		return "Space(top:\(top), left:\(left), bottom:\(bottom), right:\(right))"
	}
}

// MARK: -

public func == (left:Space, right:Space) -> Bool {
	return left.top == right.top && left.left == right.left && left.bottom == right.bottom && left.right == right.right
}
