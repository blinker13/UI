
public struct Size : Codable, Geometry {
	public let storage: SIMD2<Scalar>
}

// MARK: -

public extension Size {

	@inlinable var width: Scalar { storage.x }
	@inlinable var height: Scalar { storage.y }

	@inlinable var isEmpty: Bool { width == .zero || height == .zero }

	@inlinable init(_ value: SIMD2<Scalar>) {
		storage = value
	}

	@inlinable init(width: Scalar, height: Scalar) {
		storage = .init(width, height)
	}

	@inlinable init(sides: Scalar) {
		storage = .init(repeating: sides)
	}

	@inlinable func inseted(by space: Space) -> Self {
		.init(storage - space.storage.highHalf - space.storage.lowHalf)
	}
}

// MARK: -
//
//extension Size : Transformable {
//	public func applying(_ transform: Transform) -> Self {
//		let w = transform.a * width + transform.c * height
//		let h = transform.b * width + transform.d * height
//		return .init(width: w, height: h)
//	}
//}
