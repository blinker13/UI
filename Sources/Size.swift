
public struct Size : Geometry {

	public var width:Unit
	public var height:Unit

	public init(_ w:Unit, _ h:Unit) {
		(self.width, self.height) = (w, h)
	}
}

// MARK: -

public extension Size {

	var isEmpty:Bool { return width.isZero || height.isZero }

	init(width:Unit) { self.init(width, 0) }
	init(height:Unit) { self.init(0, height) }

	func inset(space:Space) -> Size {
		let w = width - space.right - space.left
		let h = height - space.top - space.bottom
		return Size(w, h)
	}
}

// MARK: -

extension Size : ArrangementCreatable {
	public init(values:[Arrangement:Unit]) {
		self.width = values[.Horizontal] ?? 0
		self.height = values[.Vertical] ?? 0
	}
}

// MARK: -

extension Size : ArrangementRepresentable {
	public var horizontal:Unit { return width }
	public var vertical:Unit { return height }
}

// MARK: -

extension Size : CustomStringConvertible {
	public var description:String {
		return "(width:\(width), height:\(height))"
	}
}

// MARK: -

extension Size : FloatLiteralConvertible {
	public init(floatLiteral value:Unit) {
		self.init(value, value)
	}
}

// MARK: -

extension Size : Transformable {
	public func transformed(transform:Transform) -> Size {
		let w = transform.a * width + transform.c * height
		let h = transform.b * width + transform.d * height
		return Size(w, h)
	}
}

// MARK: -

public func == (left:Size, right:Size) -> Bool {
	return left.width == right.width && left.height == right.height
}
