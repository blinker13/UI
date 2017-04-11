
public extension Composition {

	static func transform(by matrix:Transform) -> Composition {
		return self.init(.transform(matrix))
	}

	static func rotate(by angle:Float) -> Composition {
		let matrix = Transform(rotate:angle)
		return self.init(.transform(matrix))
	}

	static func scale(by size:Size) -> Composition {
		let matrix = Transform(scale:size)
		return self.init(.transform(matrix))
	}

	static func translate(by point:Point) -> Composition {
		let matrix = Transform(translate:point)
		return self.init(.transform(matrix))
	}
}
