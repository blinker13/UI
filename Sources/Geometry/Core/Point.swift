
public struct Point : Geometry {

	public var x:Float
	public var y:Float

	public init (_ x:Float, _ y:Float) {
		(self.x, self.y) = (x, y)
	}
}

public extension Point {

	public var magnitude:Float {
		let power = multiplied(by:self)
		let value = power.x + power.y
		return value.squareRoot()
	}

	init (x:Float) { self.init(x, 0) }
	init (y:Float) { self.init(0, y) }

	func converted(from rect:Rect) -> Point {
		return added(rect.bounds.origin)
	}

	func converted(to rect:Rect) -> Point {
		return subtracted(rect.bounds.origin)
	}

	func distance(to point:Point) -> Float {
		let delta = subtracted(point)
		return delta.magnitude
	}
}

extension Point : Arithmetic {

	public func added(_ value:Point) -> Point {
		return Point(x + value.x, y + value.y)
	}

	public func subtracted(_ value:Point) -> Point {
		return Point(x - value.x, y - value.y)
	}

	public func multiplied(by value:Point) -> Point {
		return Point(x * value.x, y * value.y)
	}

	public func divided(by value:Point) -> Point {
		return Point(x / value.x, y / value.y)
	}
}

extension Point : CustomPlaygroundQuickLookable {
	public var customPlaygroundQuickLook:PlaygroundQuickLook {
		return .point(
			Float64(x),
			Float64(y)
		)
	}
}

extension Point : CustomStringConvertible {
	public var description:String {
		return "x:\(x), y:\(y)"
	}
}

extension Point : Equatable {
	public static func == (left:Point, right:Point) -> Bool {
		return left.x == right.x && left.y == right.y
	}
}

extension Point : ExpressibleByFloatLiteral {
	public init (floatLiteral value:Float) {
		self.init(value, value)
	}
}

extension Point : ExpressibleByIntegerLiteral {
	public init (integerLiteral value:Float) {
		self.init(value, value)
	}
}

extension Point : Transformable {
	public func transformed(by transform:Transform) -> Point {
		let newX = transform.a * x + transform.c * y + transform.x
		let newY = transform.b * x + transform.d * y + transform.y
		return Point(newX, newY)
	}
}
