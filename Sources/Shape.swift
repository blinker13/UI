
public protocol Shape : Geometry, PathConvertible {
	var boundingBox:Rectangle { get }
	func contains(point:Point) -> Bool
}

// MARK: -

extension Shape {
	public final var top:Unit { return boundingBox.origin.y }
	public final var left:Unit { return boundingBox.origin.x }
	public final var bottom:Unit { return top + boundingBox.size.height }
	public final var right:Unit { return left + boundingBox.size.width }

	public final var center:Point {
		let x = boundingBox.size.width * 0.5
		let y = boundingBox.size.height * 0.5
		return Point(x, y)
	}

	public final var min:Point { return Point(left, top) }
	public final var max:Point { return Point(right, bottom) }

	public final var isEmpty:Bool { return boundingBox.size.isEmpty }
	public final var isFinite:Bool { return boundingBox.size.isFinite }
	public final var isInfinite:Bool { return boundingBox.size.isInfinite }
}
