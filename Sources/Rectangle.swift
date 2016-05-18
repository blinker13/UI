
public struct Rectangle : Shape {

	public var origin:Point
	public var size:Size

	// MARK: -

	public init(_ origin:Point = .zero, _ size:Size) {
		(self.origin, self.size) = (origin, size)
	}
}

// MARK: -

extension Rectangle {

	public init(origin:Point = .zero, width:Unit, height:Unit) {
		let size = Size(width, height)
		self.init(origin, size)
	}

	public init(_ x:Unit, _ y:Unit, _ w:Unit, _ h:Unit) {
		let point = Point(x, y)
		let size = Size(w, h)
		self.init(point, size)
	}

	public init(_ x:Unit, _ y:Unit, _ size:Size) {
		let point = Point(x, y)
		self.init(point, size)
	}

	public init(center:Point, radius:Unit) {
		let x = center.x - radius, y = center.y - radius
		let w = center.x + radius, h = center.y + radius
		self.init(x, y, w, h)
	}

	public init(center:Point, diameter:Unit) {
		let origin = center - diameter * 0.5
		self.init(origin:origin, width:diameter, height:diameter)
	}

	public init(points:[Point]) {
		var x1:Unit = 0.0, y1:Unit = 0.0
		var x2:Unit = 0.0, y2:Unit = 0.0

		for point in points {
			x1 = Swift.min(point.x, x1)
			y1 = Swift.min(point.y, y1)
			x2 = Swift.max(point.x, x2)
			y2 = Swift.max(point.y, y2)
		}

		self.init(x1, y1, x1 + x2, y1 + y2)
	}

	public init(_ points:Point ...) {
		self.init(points:points)
	}
	
	public func inset(space:Space) -> Rectangle {
		let x = origin.x + space.right
		let y = origin.y + space.top
		let s = size.inset(space)
		return Rectangle(x, y, s)
	}
}

// MARK: -

extension Rectangle {

	public var boundingBox:Rectangle {
		let opposite = Point(origin.x + size.width, origin.y + size.height)
		return Rectangle(origin, opposite)
	}

	public var elements:[Path.Element] {
		return [
			.MoveTo(Point(right, top)),
			.LineTo(Point(left, top)),
			.LineTo(Point(left, bottom)),
			.LineTo(Point(right, bottom)),
			.Close
		]
	}

	public func contains(point:Point) -> Bool {
		return point.x >= left && point.x <= right && point.y >= top && point.y <= bottom
	}

	public func transformed(transform:Transform) -> Rectangle {
		let point = origin.transformed(transform)
		let w = transform.a * size.width + transform.c * size.height
		let h = transform.b * size.width + transform.d * size.height
		return Rectangle(origin:point, width:w, height:h)
	}
}

// MARK: - FloatLiteralConvertible

extension Rectangle : FloatLiteralConvertible {
	public init(floatLiteral value:Unit) {
		self.init(origin:.zero, width:value, height:value)
	}
}

// MARK: - CustomStringConvertible

extension Rectangle : CustomStringConvertible {
	public var description:String {
		return "Rectangle(origin:\(origin), size:\(size))"
	}
}

// MARK: -

public func == (left:Rectangle, right:Rectangle) -> Bool {
	return left.origin == right.origin && left.size == right.size
}
