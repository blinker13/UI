
public enum Distribution : String, Codable {
	case proportional
	case ordered
	case equal
}

// MARK: -

internal extension Distribution {

	var calculate:(Float, Float) -> Float {
		switch self {
			case .proportional: return proportion
			case .ordered: return orderly
			case .equal: return equaly
		}
	}

	func determineFactor(for layouts:[Layout]) -> Float {
		switch self {
			case .proportional: return 1.0 / layouts.reduce(0.0, add)
			case .ordered: return 1.0
			case .equal: return 1.0 / Float(layouts.count)
		}
	}
}

// MARK: -

private extension Distribution {

	func proportion(size:Float, by factor:Float) -> Float {
		return size * factor
	}

	func orderly(size:Float, by factor:Float) -> Float {
		return 1.0
	}

	func equaly(size:Float, by factor:Float) -> Float {
		return factor
	}

	func add(remains:Float, layout:Layout) -> Float {
		return remains + layout.main.size
	}
}
