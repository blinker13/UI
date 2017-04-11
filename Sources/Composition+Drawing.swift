
public extension Composition {

	static func clear(_ rect:Rect) -> Composition {
		return [ .clear(rect) ]
	}

	static func draw(_ rule:Composition.Rule = .nonZero) -> Composition {
		return [ .fill(rule), .stroke ]
	}

	static func draw(_ shape:Shape, rule:Composition.Rule = .nonZero) -> Composition {
		return [ .addShape(shape), .draw(rule), .stroke ]
	}

	static func fill(_ rule:Composition.Rule = .nonZero) -> Composition {
		return [ .fill(rule) ]
	}

	static func fill(_ shape:Shape, rule:Composition.Rule = .nonZero) -> Composition {
		return [ .addShape(shape), .fill(rule) ]
	}

	static func stroke() -> Composition {
		return [ .stroke ]
	}

	static func stroke(_ shape:Shape) -> Composition {
		return [ .addShape(shape), .stroke ]
	}
}
