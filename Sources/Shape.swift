
public protocol Shape {

	var path:Path { get }
	var bounds:Rect { get }

	func contains(_ point:Point) -> Bool
}

public extension Shape {

	var isEmpty:Bool { return bounds.size.isEmpty }
	var isFinite:Bool { return bounds.size.isFinite }
	var isInfinite:Bool { return bounds.size.isInfinite }

	var top:Float { return bounds.origin.y }
	var right:Float { return left + bounds.size.width }
	var bottom:Float { return top + bounds.size.height }
	var left:Float { return bounds.origin.x }

	var min:Point { return Point(left, top) }
	var max:Point { return Point(right, bottom) }

	var center:Point {
		let x = bounds.size.width * 0.5
		let y = bounds.size.height * 0.5
		return Point(x, y)
	}
}
