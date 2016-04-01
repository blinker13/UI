
public struct Size : Equatable, FloatLiteralConvertible, Geometry {

	public var width:Unit
	public var height:Unit

	public var isEmpty:Bool { return width.isZero || height.isZero }

	// MARK: -

	public init(_ w:Unit, _ h:Unit) {
		(self.width, self.height) = (w, h)
	}

	public init(width:Unit) {
		self.init(width, 0.0)
	}

	public init(height:Unit) {
		self.init(0.0, height)
	}

	public init(floatLiteral value:Unit) {
		self.init(value, value)
	}

	// MARK: -


	public func transformed(transform:Transform) -> Size {
		return self
	}
}

// MARK: - CustomStringConvertible

extension Size : CustomStringConvertible {
	public var description:String {
		return "(width:\(width), height:\(height))"
	}
}

// MARK: -

public func == (left:Size, right:Size) -> Bool {
	return left.width == right.width && left.height == right.height
}
