
public protocol Shape {
	var boundingBox:Rectangle { get }
	var elements:[Path.Element] { get }
	func contains(point:Point) -> Bool
}

// MARK: -

public extension Shape {

	var top:Unit { return boundingBox.origin.y }
	var left:Unit { return boundingBox.origin.x }
	var bottom:Unit { return top + boundingBox.size.height }
	var right:Unit { return left + boundingBox.size.width }

	var center:Point {
		let x = boundingBox.size.width * 0.5
		let y = boundingBox.size.height * 0.5
		return Point(x, y)
	}

	var min:Point { return Point(left, top) }
	var max:Point { return Point(right, bottom) }

	var isEmpty:Bool { return boundingBox.size.isEmpty }
	var isFinite:Bool { return boundingBox.size.isFinite }
	var isInfinite:Bool { return boundingBox.size.isInfinite }
}
