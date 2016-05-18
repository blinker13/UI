
public struct Transform : Geometry {

	public static let identity = Transform()

	// MARK: -

	public let a:Unit
	public let b:Unit
	public let c:Unit
	public let d:Unit
	public let x:Unit
	public let y:Unit

	// MARK: -

	public init(_ a:Unit = 1, _ b:Unit = 0, _ c:Unit = 0, _ d:Unit = 1, _ x:Unit = 0, _ y:Unit = 0) {
		(self.a, self.b, self.c, self.d, self.x, self.y) = (a, b, c, d, x, y)
	}
}

// MARK: -

extension Transform {

	public init(rotated a:Unit) {
		// TODO: calculate transformation values
		self.init(1, 0, 0, 1, 0, 0)
	}

	public init(scaled size:Size) {
		self.init(size.width, 0, 0, size.height, 0, 0)
	}

	public init(scaled w:Unit, _ h:Unit) {
		self.init(w, 0, 0, h, 0, 0)
	}

	public init(translated point:Point) {
		self.init(1, 0, 0, 1, point.x, point.y)
	}

	public init(translated x:Unit, _ y:Unit) {
		self.init(1, 0, 0, 1, x, y)
	}

	public var isIdentity:Bool {
		return self == .identity
	}

	public var inverted:Transform {
		let determinant = 1 / (a * d - b * c)
		let newA = determinant * d
		let newB = determinant * -b
		let newC = determinant * -c
		let newD = determinant * a
		let newX = determinant * (c * y - d * x)
		let newY = determinant * (b * x - a * y)
		return Transform(newA, newB, newC, newD, newX, newY)
	}

	public func transformed(transform:Transform) -> Transform {
		let newA = transform.a * a + transform.b * c
		let newB = transform.a * b + transform.b * d
		let newC = transform.c * a + transform.d * c
		let newD = transform.c * b + transform.d * d
		let newX = transform.x * a + transform.y * c + x
		let newY = transform.x * b + transform.y * d + y
		return Transform(newA, newB, newC, newD, newX, newY)
	}
}

// MARK: - CustomStringConvertible

extension Transform : CustomStringConvertible {
	public var description:String {
		return "Transform(\(a), \(b), \(c), \(d), \(x), \(y))"
	}
}

// MARK: -

public func == (left:Transform, right:Transform) -> Bool {
	return left.a == right.a && left.b == right.b && left.c == right.c && left.d == right.d && left.x == right.x && left.y == right.y
}
