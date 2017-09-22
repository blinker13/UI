
import Geometry

public extension Composition {

	static func rotate(by angle:Float) -> Composition {
		let matrix = Transform(rotate:angle)
		return [ .transform(matrix) ]
	}

	static func scale(by size:Size) -> Composition {
		let matrix = Transform(scale:size)
		return [ .transform(matrix) ]
	}

	static func translate(by point:Point) -> Composition {
		let matrix = Transform(translate:point)
		return [ .transform(matrix) ]
	}
}

public extension Composition {

	static func scale(width:Float = 0, height:Float = 0) -> Composition {
		let size = Size(width, height)
		return scale(by:size)
	}

	static func translate(x:Float = 0, y:Float = 0) -> Composition {
		return translate(by:Point(x, y))
	}
}
