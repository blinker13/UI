
import Geometry

public extension Composition {

	static func stack(_ compositions:Composition ...) -> Composition {
		return [ .save, .compound(compositions), .restore ]
	}

	static func color(_ color:Color) -> Composition {
		return [ .setStroke(color), .setFill(color) ]
	}

	// MARK: -

	static func add(_ shapes:Shape ...) -> Composition {
		return .adding(shapes)
	}

	static func add(_ shapes:[Shape]) -> Composition {
		return .adding(shapes)
	}

	// MARK: -

	static func add(_ elements:Path.Element ...) -> Composition {
		let path = Path(with:elements)
		return .adding([path])
	}
}
