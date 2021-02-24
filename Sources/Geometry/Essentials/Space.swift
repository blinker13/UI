
public struct Space : Arithmetic, Codable, SIMDRepesentable {
	public let storage: SIMD4<Scalar>
}

// MARK: -

public extension Space {

	@inlinable var top: Scalar { storage.y }
	@inlinable var left: Scalar { storage.x }
	@inlinable var bottom: Scalar { storage.w }
	@inlinable var right: Scalar { storage.z }

	@inlinable init(_ value: SIMD4<Scalar>) {
		storage = value
	}

	@inlinable init(top: Scalar = .zero, left: Scalar = .zero, bottom: Scalar = .zero, right: Scalar = .zero) {
		storage = .init(left, top, right, bottom)
	}

	@inlinable init(horizontal: Scalar = .zero, vertical: Scalar = .zero) {
		storage = .init(horizontal, vertical, horizontal, vertical)
	}

	@inlinable init(all value: Scalar) {
		storage = .init(repeating: value)
	}
}
