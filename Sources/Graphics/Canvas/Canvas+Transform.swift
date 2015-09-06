
public extension Canvas {

	static func rotate(by angle:Float) -> Canvas {
		let matrix = Transform(rotate:angle)
		return [ .transform(matrix) ]
	}

	static func scale(by size:Size) -> Canvas {
		let matrix = Transform(scale:size)
		return [ .transform(matrix) ]
	}

	static func translate(by point:Point) -> Canvas {
		let matrix = Transform(translate:point)
		return [ .transform(matrix) ]
	}
}

public extension Canvas {

	static func scale(width:Float = 0, height:Float = 0) -> Canvas {
		let size = Size(width, height)
		return scale(by:size)
	}

	static func translate(x:Float = 0, y:Float = 0) -> Canvas {
		return translate(by:Point(x, y))
	}
}
