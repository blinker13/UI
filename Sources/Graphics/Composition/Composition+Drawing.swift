
import Geometry

public extension Composition {

	static func clear(_ rects:Rect ...) -> Composition {
		return .clearing(rects)
	}

	// MARK: -

	static func draw(_ rule:Composition.Rule = .nonzero, _ shapes:Shape ...) -> Composition {
		return [ .adding(shapes), .filling(rule), .stroking ]
	}

	static func draw(_ rule:Composition.Rule = .nonzero, _ shapes:[Shape]) -> Composition {
		return [ .adding(shapes), .filling(rule), .stroking ]
	}

	static func draw(_ rule:Composition.Rule = .nonzero, _ shape:Shape) -> Composition {
		return [ .adding([shape]), .filling(rule), .stroking ]
	}

	static func draw(_ rule:Composition.Rule = .nonzero) -> Composition {
		return [ .filling(rule), .stroking ]
	}

	// MARK: -

	static func fill(_ rule:Composition.Rule = .nonzero, _ shapes:Shape ...) -> Composition {
		return [ .adding(shapes), .filling(rule) ]
	}

	static func fill(_ rule:Composition.Rule = .nonzero, _ shapes:[Shape]) -> Composition {
		return [ .adding(shapes), .filling(rule) ]
	}

	static func fill(_ rule:Composition.Rule = .nonzero, _ shape:Shape) -> Composition {
		return [ .adding([shape]), .filling(rule) ]
	}

	static func fill(_ rule:Composition.Rule = .nonzero) -> Composition {
		return .filling(rule)
	}

	// MARK: -

	static func stroke(_ shapes:Shape ...) -> Composition {
		return [ .adding(shapes), .stroking ]
	}

	static func stroke(_ shapes:[Shape]) -> Composition {
		return [ .adding(shapes), .stroking ]
	}

	static let stroke:Composition = .stroking
}
