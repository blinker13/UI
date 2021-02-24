
import simd

public struct Transform : Hashable {

	public let a: Scalar
	public let b: Scalar
	public let c: Scalar
	public let d: Scalar
	public let x: Scalar
	public let y: Scalar

	public var inverted: Self {
		let determinant = 1 / (a * d - b * c)
		let newA = determinant * d
		let newB = determinant * -b
		let newC = determinant * -c
		let newD = determinant * a
		let newX = determinant * (c * y - d * x)
		let newY = determinant * (b * x - a * y)
		return .init(newA, newB, newC, newD, newX, newY)
	}
}

// MARK: -

extension Transform {

	@inlinable public static var identity: Self { .init(1, 0, 0, 1, 0, 0) }

	@inlinable public static func rotate(by angle: Angle = .half) -> Self { .init(rotate: angle) }
	@inlinable public static func scale(by size: Size) -> Self { .init(scale: size) }
	@inlinable public static func translate(by point: Point) -> Self { .init(translate: point) }

	@inlinable public init(_ a: Scalar, _ b: Scalar, _ c: Scalar, _ d: Scalar, _ x: Scalar, _ y: Scalar) {
		(self.a, self.b, self.c, self.d, self.x, self.y) = (a, b, c, d, x, y)
	}

	@inlinable public init(rotate angle: Angle) {
		// TODO: calculate transformation values
		self.init(1, 0, 0, 1, 0, 0)
	}

	@inlinable public init(scale size: Size) {
		self.init(size.width, 0, 0, size.height, 0, 0)
	}

	@inlinable public init(translate point: Point) {
		self.init(1, 0, 0, 1, point.x, point.y)
	}
}

// MARK: -
//
//extension Transform : Transformable {
//	public func applying(_ transform: Self) -> Self {
//		let newA = transform.a * a + transform.b * c
//		let newB = transform.a * b + transform.b * d
//		let newC = transform.c * a + transform.d * c
//		let newD = transform.c * b + transform.d * d
//		let newX = transform.x * a + transform.y * c + x
//		let newY = transform.x * b + transform.y * d + y
//		return .init(newA, newB, newC, newD, newX, newY)
//	}
//}
