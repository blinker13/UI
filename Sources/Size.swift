
public struct Size : Geometry {

	public var width:Unit
	public var height:Unit

	// MARK: -

	public init(_ w:Unit, _ h:Unit) {
		(self.width, self.height) = (w, h)
	}
}

// MARK: -

extension Size {

	public init(width:Unit) {
		self.init(width, 0)
	}

	public init(height:Unit) {
		self.init(0, height)
	}
	
	public var isEmpty:Bool { return width.isZero || height.isZero }

	public func transformed(_ transform:Transform) -> Size {
		return self
	}

	public func inset(_ space:Space) -> Size {
		let w = width - space.right - space.left
		let h = height - space.top - space.bottom
		return Size(w, h)
	}
}

// MARK: - ArrangementCreatable

extension Size : ArrangementCreatable {
	public init(values:[Arrangement:Unit]) {
		self.width = values[.Horizontal] ?? 0
		self.height = values[.Vertical] ?? 0
	}
}

// MARK: - ArrangementRepresentable

extension Size : ArrangementRepresentable {
	public var horizontal:Unit { return width }
	public var vertical:Unit { return height }
}

// MARK: - CustomStringConvertible

extension Size : CustomStringConvertible {
	public var description:String {
		return "(width:\(width), height:\(height))"
	}
}

// MARK: - FloatLiteralConvertible

extension Size : FloatLiteralConvertible {
	public init(floatLiteral value:Unit) {
		self.init(value, value)
	}
}

// MARK: -

public func == (left:Size, right:Size) -> Bool {
	return left.width == right.width && left.height == right.height
}
