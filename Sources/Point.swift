
public struct Point : Geometry {

	public var x:Unit
	public var y:Unit

	public init(_ x:Unit, _ y:Unit) {
		(self.x, self.y) = (x, y)
	}
}

// MARK: -

public extension Point {
	init(x:Unit) { self.init(x, 0) }
	init(y:Unit) { self.init(0, y) }
}

// MARK: -

extension Point : ArrangementCreatable {
	public init(values:[Arrangement:Unit]) {
		self.x = values[.Horizontal] ?? 0
		self.y = values[.Vertical] ?? 0
	}
}

// MARK: -

extension Point : ArrangementRepresentable {
	public var horizontal:Unit { return x }
	public var vertical:Unit { return y }
}

// MARK: -

extension Point : CustomStringConvertible {
	public var description:String {
		return "(x:\(x), y:\(y))"
	}
}

// MARK: -

extension Point : FloatLiteralConvertible {
	public init(floatLiteral value:Unit) {
		self.init(value, value)
	}
}

// MARK: -

extension Point : Transformable {
	public func transformed(transform:Transform) -> Point {
		let newX = transform.a * x + transform.c * y + transform.x
		let newY = transform.b * x + transform.d * y + transform.y
		return Point(newX, newY)
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
