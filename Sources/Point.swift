
public struct Point : Geometry {

	public var x:Unit
	public var y:Unit

	// MARK: -

	public init(_ x:Unit, _ y:Unit) {
		(self.x, self.y) = (x, y)
	}
}

// MARK: -

extension Point {

	public init(x:Unit) {
		self.init(x, 0)
	}

	public init(y:Unit) {
		self.init(0, y)
	}
	
	public func transformed(_ transform:Transform) -> Point {
		let newX = transform.a * x + transform.c * y + transform.x
		let newY = transform.b * x + transform.d * y + transform.y
		return Point(newX, newY)
	}
}

// MARK: - ArrangementCreatable

extension Point : ArrangementCreatable {
	public init(values:[Arrangement:Unit]) {
		self.x = values[.Horizontal] ?? 0
		self.y = values[.Vertical] ?? 0
	}
}

// MARK: - ArrangementRepresentable

extension Point : ArrangementRepresentable {
	public var horizontal:Unit { return x }
	public var vertical:Unit { return y }
}

// MARK: - CustomStringConvertible

extension Point : CustomStringConvertible {
	public var description:String {
		return "(x:\(x), y:\(y))"
	}
}

// MARK: - FloatLiteralConvertible

extension Point : FloatLiteralConvertible {
	public init(floatLiteral value:Unit) {
		self.init(value, value)
	}
}

// MARK: -

public func == (left:Point, right:Point) -> Bool {
	return left.x == right.x && left.y == right.y
}

public func + (left:Point, right:Point) -> Point {
	return Point(left.x + right.x, left.y + right.y)
}

public func - (left:Point, right:Point) -> Point {
	return Point(left.x - right.x, left.y - right.y)
}

public func * (left:Point, right:Point) -> Point {
	return Point(left.x * right.x, left.y * right.y)
}

public func * (left:Point, right:Unit) -> Point {
	return Point(left.x * right, left.y * right)
}

public func * (left:Unit, right:Point) -> Point {
	return Point(left * right.x, left * right.y)
}

public func / (left:Point, right:Unit) -> Point {
	return Point(left.x / right, left.y / right)
}
