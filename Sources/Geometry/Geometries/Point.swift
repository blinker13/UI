
public struct Point : Codable, Geometry {
	public let storage: SIMD2<Scalar>
}

// MARK: -

public extension Point {

	@inlinable static var infinity: Self { .init(xy: .infinity) }

	@inlinable static var top: Self    { .init(x: 0.5, y: 0.0) }
	@inlinable static var left: Self   { .init(x: 0.0, y: 0.5) }
	@inlinable static var bottom: Self { .init(x: 0.5, y: 1.0) }
	@inlinable static var right: Self  { .init(x: 1.0, y: 0.5) }

	@inlinable static var topLeft: Self     { .init(x: 0.0, y: 0.0) }
	@inlinable static var topRight: Self    { .init(x: 1.0, y: 0.0) }
	@inlinable static var bottomLeft: Self  { .init(x: 0.0, y: 1.0) }
	@inlinable static var bottomRight: Self { .init(x: 1.0, y: 1.0) }

	@inlinable static var center: Self { 0.5 }

	@inlinable var x: Scalar { storage.x }
	@inlinable var y: Scalar { storage.y }

	@inlinable init(_ value: SIMD2<Scalar>) {
		storage = value
	}

	@inlinable init(x: Scalar = .zero, y: Scalar = .zero) {
		storage = .init(x, y)
	}

	@inlinable init(xy: Scalar) {
		storage = .init(repeating: xy)
	}
}

// MARK: -
//
//extension Point : Transformable {
//	public func applying(_ transform: Transform) -> Self {
//		let newX = transform.a * x + transform.c * y + transform.x
//		let newY = transform.b * x + transform.d * y + transform.y
//		return .init(x: newX, y: newY)
//	}
//}
