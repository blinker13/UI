
public protocol Geometry : Arithmetic, SIMDRepesentable {
	func addingProduct(_ left: Self, _ right: Self) -> Self
	func squareRoot() -> Self
}

// MARK: -

public extension Geometry {

	@inlinable func addingProduct(_ left: Self, _ right: Self) -> Self {
		.init(storage.addingProduct(left.storage, right.storage))
	}

	@inlinable func squareRoot() -> Self {
		.init(storage.squareRoot())
	}
}

// MARK: -

public extension Array where Element : Geometry {

	@inlinable func addingProduct(_ left: Element, _ right: Element) -> Self {
		map { $0.addingProduct(left, right) }
	}

	@inlinable func squareRoot() -> Self {
		map { $0.squareRoot() }
	}
}
