
public struct Transform : Hashable {

	public let a:Float
	public let b:Float
	public let c:Float
	public let d:Float
	public let x:Float
	public let y:Float

	public init (_ a:Float, _ b:Float, _ c:Float, _ d:Float, _ x:Float, _ y:Float) {
		(self.a, self.b, self.c, self.d, self.x, self.y) = (a, b, c, d, x, y)
	}
}

public extension Transform {

	static let identity = Transform(1, 0, 0, 1, 0, 0)

	var inverted:Transform {
		let determinant = 1 / (a * d - b * c)
		let newA = determinant * d
		let newB = determinant * -b
		let newC = determinant * -c
		let newD = determinant * a
		let newX = determinant * (c * y - d * x)
		let newY = determinant * (b * x - a * y)
		return Transform(newA, newB, newC, newD, newX, newY)
	}

	var isIdentity:Bool {
		return self == .identity
	}

	init (rotate angle:Float) {
		// TODO: calculate transformation values
		self.init(1, 0, 0, 1, 0, 0)
	}

	init (scale size:Size) {
		self.init(size.width, 0, 0, size.height, 0, 0)
	}

	init (translate point:Point) {
		self.init(1, 0, 0, 1, point.x, point.y)
	}
}

extension Transform : CustomStringConvertible {
	public var description:String {
		return "{ \(a), \(b), \(c), \(d), \(x), \(y) }"
	}
}

extension Transform : Transformable {
	public func transformed(by transform:Transform) -> Transform {
		let newA = transform.a * a + transform.b * c
		let newB = transform.a * b + transform.b * d
		let newC = transform.c * a + transform.d * c
		let newD = transform.c * b + transform.d * d
		let newX = transform.x * a + transform.y * c + x
		let newY = transform.x * b + transform.y * d + y
		return Transform(newA, newB, newC, newD, newX, newY)
	}
}
