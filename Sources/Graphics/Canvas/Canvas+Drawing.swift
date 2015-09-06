
public extension Canvas {

	static func clear(_ rects:Rect ...) -> Canvas {
		return .clearing(rects)
	}

	// MARK: -

	static func draw(_ rule:Canvas.Rule = .nonzero, _ shapes:Shape ...) -> Canvas {
		return [ .adding(shapes), .filling(rule), .stroking ]
	}

	static func draw(_ rule:Canvas.Rule = .nonzero, _ shapes:[Shape]) -> Canvas {
		return [ .adding(shapes), .filling(rule), .stroking ]
	}

	static func draw(_ rule:Canvas.Rule = .nonzero, _ shape:Shape) -> Canvas {
		return [ .adding([shape]), .filling(rule), .stroking ]
	}

	static func draw(_ rule:Canvas.Rule = .nonzero) -> Canvas {
		return [ .filling(rule), .stroking ]
	}

	// MARK: -

	static func fill(_ rule:Canvas.Rule = .nonzero, _ shapes:Shape ...) -> Canvas {
		return [ .adding(shapes), .filling(rule) ]
	}

	static func fill(_ rule:Canvas.Rule = .nonzero, _ shapes:[Shape]) -> Canvas {
		return [ .adding(shapes), .filling(rule) ]
	}

	static func fill(_ rule:Canvas.Rule = .nonzero, _ shape:Shape) -> Canvas {
		return [ .adding([shape]), .filling(rule) ]
	}

	static func fill(_ rule:Canvas.Rule = .nonzero) -> Canvas {
		return .filling(rule)
	}

	// MARK: -

	static func stroke(_ shapes:Shape ...) -> Canvas {
		return [ .adding(shapes), .stroking ]
	}

	static func stroke(_ shapes:[Shape]) -> Canvas {
		return [ .adding(shapes), .stroking ]
	}

	static let stroke:Canvas = .stroking
}
