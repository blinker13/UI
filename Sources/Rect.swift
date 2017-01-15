
public struct Rect : Geometry, Shape {

	public var origin:Point
	public var size:Size

	public init (origin:Point, size:Size) {
		(self.origin, self.size) = (origin, size)
	}
}

public extension Rect {

	var bounds:Rect {
		let top = Swift.min(origin.y, origin.y + size.height)
		let left = Swift.min(origin.x, origin.x + size.width)
		let bottom = Swift.max(origin.y, origin.y + size.height)
		let right = Swift.max(origin.x, origin.x + size.width)
		return Rect(left, top, right - left, bottom - top)
	}

	var elements:[Path.Element] {
		return [
			.move(to:Point(right, top)),
			.line(to:Point(left, top)),
			.line(to:Point(left, bottom)),
			.line(to:Point(right, bottom)),
			.close
		]
	}

	var isFinite:Bool { return size.isFinite }
	var isInfinite:Bool { return size.isInfinite }
	var isEmpty:Bool { return size.isEmpty }

	init (origin:Point = .zero, width:Float, height:Float) {
		self.size = Size(width, height)
		self.origin = origin
	}

	init (_ size:Size) {
		self.origin = .zero
		self.size = size
	}

	init (_ x:Float, _ y:Float, _ w:Float, _ h:Float) {
		self.origin = Point(x, y)
		self.size = Size(w, h)
	}

	init (_ x:Float, _ y:Float, _ size:Size) {
		self.origin = Point(x, y)
		self.size = size
	}

	init (center:Point, radius:Float) {
		self.origin = Point(center.x - radius, center.y - radius)
		self.size = Size(center.x + radius, center.y + radius)
	}

	init (center:Point, diameter:Float) {
		let radius = Point(floatLiteral:diameter * 0.5)
		self.origin = center.subtracted(radius)
		self.size = Size(floatLiteral:diameter)
	}

	init (points:[Point]) {
		var x1:Float = 0.0, y1:Float = 0.0
		var x2:Float = 0.0, y2:Float = 0.0

		for point in points {
			x1 = Swift.min(point.x, x1)
			y1 = Swift.min(point.y, y1)
			x2 = Swift.max(point.x, x2)
			y2 = Swift.max(point.y, y2)
		}

		self.init(x1, y1, x1 + x2, y1 + y2)
	}

	init (_ points:Point ...) {
		self.init(points:points)
	}
	
	func inset(_ space:Space) -> Rect {
		let x = origin.x + space.right
		let y = origin.y + space.top
		let s = size.inseted(by:space)
		return Rect(x, y, s)
	}

	func contains(_ point:Point) -> Bool {
		return point.x >= left && point.x <= right && point.y >= top && point.y <= bottom
	}
}

extension Rect : CustomPlaygroundQuickLookable {
	public var customPlaygroundQuickLook:PlaygroundQuickLook {
		return .rectangle(
			Float64(origin.x),
			Float64(origin.y),
			Float64(size.width),
			Float64(size.height)
		)
	}
}

extension Rect : CustomStringConvertible {
	public var description:String {
		return "\(origin), \(size)"
	}
}

extension Rect : Equatable {
	public static func == (left:Rect, right:Rect) -> Bool {
		return left.origin == right.origin && left.size == right.size
	}
}

extension Rect : ExpressibleByFloatLiteral {
	public init (floatLiteral value:Float) {
		self.init(origin:.zero, width:value, height:value)
	}
}

extension Rect : Transformable {
	public func transformed(by transform:Transform) -> Rect {
		let newOrigin = origin.transformed(by:transform)
		let newSize = size.transformed(by:transform)
		return Rect(origin:newOrigin, size:newSize)
	}
}
