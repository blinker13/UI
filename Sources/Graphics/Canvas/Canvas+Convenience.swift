
import Geometry

public extension Canvas {

	static func stack(_ canvas:Canvas ...) -> Canvas {
		return [ .save, .compound(canvas), .restore ]
	}

	static func color(_ color:Color) -> Canvas {
		return [ .setStroke(color), .setFill(color) ]
	}

	// MARK: -

	static func add(_ shapes:Shape ...) -> Canvas {
		return .adding(shapes)
	}

	static func add(_ shapes:[Shape]) -> Canvas {
		return .adding(shapes)
	}

	// MARK: -

	static func add(_ elements:Path.Element ...) -> Canvas {
		let path = Path(with:elements)
		return .adding([path])
	}
}
