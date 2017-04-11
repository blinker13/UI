
public extension Composition {

	static func setFlatness(_ value:Float) -> Composition {
		return [ .setFlatness(value) ]
	}

	static func setLineCap(_ value:Line.Cap) -> Composition {
		return [ .setLineCap(value) ]
	}

	static func setLineJoin(_ value:Line.Join) -> Composition {
		return [ .setLineJoin(value) ]
	}

	static func setLineWidth(_ value:Line.Width) -> Composition {
		return [ .setLineWidth(value) ]
	}

	// MARK: -

	static func setOpacity(_ value:Float) -> Composition {
		return [ .setOpacity(value) ]
	}

	static func setFill(_ color:Color) -> Composition {
		return [ .setFillColor(color) ]
	}

	static func setStroke(_ color:Color) -> Composition {
		return [ .setStrokeColor(color) ]
	}
}
