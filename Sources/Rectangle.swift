
public struct Rectangle : Geometry, Shape {
	public var origin:Point
	public var size:Size
}

// MARK: -

public extension Rectangle {

	var boundingBox:Rectangle {
		let opposite = Point(origin.x + size.width, origin.y + size.height)
		return Rectangle(origin, opposite)
	}

	var elements:[Path.Element] {
		return [
			.moveTo(Point(right, top)),
			.lineTo(Point(left, top)),
			.lineTo(Point(left, bottom)),
			.lineTo(Point(right, bottom)),
			.close
		]
	}

	var isFinite:Bool { return size.isFinite }
	var isInfinite:Bool { return size.isInfinite }
	var isEmpty:Bool { return size.isEmpty }

	init(origin:Point = .zero, width:Unit, height:Unit) {
		self.size = Size(width, height)
		self.origin = origin
	}

	init(_ x:Unit, _ y:Unit, _ w:Unit, _ h:Unit) {
		self.origin = Point(x, y)
		self.size = Size(w, h)
	}

	init(_ x:Unit, _ y:Unit, _ size:Size) {
		self.origin = Point(x, y)
		self.size = size
	}

	init(center:Point, radius:Unit) {
		self.origin = Point(center.x - radius, center.y - radius)
		self.size = Size(center.x + radius, center.y + radius)
	}

	init(center:Point, diameter:Unit) {
		self.origin = center - diameter * 0.5
		self.size = Size(floatLiteral:diameter)
	}

	init(points:[Point]) {
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

	init(_ points:Point ...) {
		self.init(points:points)
	}
	
	func inset(_ space:Space) -> Rectangle {
		let x = origin.x + space.right
		let y = origin.y + space.top
		let s = size.inset(space)
		return Rectangle(x, y, s)
	}

	func contains(_ point:Point) -> Bool {
		return point.x >= left && point.x <= right && point.y >= top && point.y <= bottom
	}
}

// MARK: -

extension Rectangle : CustomStringConvertible {
	public var description:String {
		return "Rectangle(origin:\(origin), size:\(size))"
	}
}

// MARK: -

extension Rectangle : FloatLiteralConvertible {
	public init(floatLiteral value:Unit) {
		self.init(origin:.zero, width:value, height:value)
	}
}

// MARK: -

extension Rectangle : Transformable {
	public func transformed(_ transform:Transform) -> Rectangle {
		let newOrigin = origin.transformed(transform)
		let newSize = size.transformed(transform)
		return Rectangle(origin:newOrigin, size:newSize)
	}
}

// MARK: -

public func == (left:Rectangle, right:Rectangle) -> Bool {
	return left.origin == right.origin && left.size == right.size
}
