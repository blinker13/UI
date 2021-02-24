
public struct Vector : Codable, Geometry {
	public let storage: SIMD3<Scalar>
}

// MARK: -

public extension Vector {

	@inlinable static var infinity: Self { .init(xyz: .infinity) }

	@inlinable var x: Scalar { storage.x }
	@inlinable var y: Scalar { storage.y }
	@inlinable var z: Scalar { storage.z }

	@inlinable init(_ value: SIMD3<Scalar>) {
		storage = value
	}

	@inlinable init(x: Scalar = .zero, y: Scalar = .zero, z: Scalar = .zero) {
		storage = .init(x, y, z)
	}

	@inlinable init(xyz: Scalar) {
		storage = .init(repeating: xyz)
	}

	@inlinable init(with point: Point) {
		storage = .init(point.storage, .zero)
	}
}
