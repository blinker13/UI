
public protocol Shape {
	var bounds:Rect { get }
	var elements:[Path.Element] { get }
	func contains(_ point:Point) -> Bool
}

public extension Shape {

	var top:Float { return bounds.origin.y }
	var left:Float { return bounds.origin.x }
	var bottom:Float { return top + bounds.size.height }
	var right:Float { return left + bounds.size.width }

	var center:Point {
		let x = bounds.size.width * 0.5
		let y = bounds.size.height * 0.5
		return Point(x, y)
	}

	var min:Point { return Point(left, top) }
	var max:Point { return Point(right, bottom) }

	var isEmpty:Bool { return bounds.size.isEmpty }
	var isFinite:Bool { return bounds.size.isFinite }
	var isInfinite:Bool { return bounds.size.isInfinite }

	var path: Path { return Path(with:elements) }
}
