
public struct Rectangle : Equatable, Shape {

	public let origin: Point
	public let size: Size


	public init(origin: Point = .zero, size: Size) {
		self.origin = origin
		self.size = size
	}
}

// MARK: -

public extension Rectangle {

	@inlinable static var zero: Self { .init(origin: .zero, size: .zero) }
	@inlinable static var null: Self { .init(origin: .infinity, size: .zero) }

	@inlinable var x: Scalar { origin.x }
	@inlinable var y: Scalar { origin.y }

	@inlinable var width: Scalar { abs(size.width) }
	@inlinable var height: Scalar { abs(size.height) }

	@inlinable var minX: Scalar { min(x, x + size.width) }
	@inlinable var minY: Scalar { min(y, y + size.height) }
	@inlinable var midX: Scalar { (minX + maxX) * 0.5 }
	@inlinable var midY: Scalar { (minY + maxY) * 0.5 }
	@inlinable var maxX: Scalar { max(x, x + size.width) }
	@inlinable var maxY: Scalar { max(y, y + size.height) }

	@inlinable var center: Point { .init(x: midX, y: midY) }

	@inlinable var horizontal: Range<Scalar> { minX ..< maxX }
	@inlinable var vertical: Range<Scalar> { minY ..< maxY }

	@inlinable var isNull: Bool { x == .infinity || y == .infinity }
	@inlinable var isEmpty: Bool { isNull || size.isEmpty }

	@inlinable var path: Path {
		[
			.move(to: .init(x: minX, y: minY)),
			.line(to: .init(x: maxX, y: minY)),
			.line(to: .init(x: maxX, y: maxY)),
			.line(to: .init(x: minX, y: maxY)),
			.close
		]
	}

	@inlinable init(x: Scalar = .zero, y: Scalar = .zero, width: Scalar, height: Scalar) {
		(self.origin, self.size) = (.init(x: x, y: y), .init(width: width, height: height))
	}

	@inlinable init(origin: Point = .zero, sides: Scalar) {
		(self.origin, self.size) = (origin, .init(sides: sides))
	}

	@inlinable func contains(_ point: Point) -> Bool {
		vertical.contains(point.x) && horizontal.contains(point.y)
	}
	
	@inlinable func inset(_ space: Space) -> Self {
		let new = Point(origin.storage + space.storage.highHalf)
		return .init(origin: new, size: size.inseted(by: space))
	}
}

// MARK: -
//
//extension Rectangle : Transformable {
//	public func applying(_ transform: Transform) -> Self {
//		let newOrigin = origin.applying(transform)
//		let newSize = size.applying(transform)
//		return .init(origin: newOrigin, size: newSize)
//	}
//}
