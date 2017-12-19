
import Geometry

public enum Arrangement : String, Codable {
	case horizontal
	case vertical
}

// MARK: -

public extension Arrangement {

	var flipped:Arrangement {
		switch self {
			case .horizontal: return .vertical
			case .vertical: return .horizontal
		}
	}
}

// MARK: -

internal extension Arrangement {
	var layoutKey:WritableKeyPath<Layout, Dimension> {
		switch self {
			case .horizontal: return \Layout.main
			case .vertical: return \Layout.cross
		}
	}
}

// MARK: -

private extension Arrangement {

	func convert(horizontal layout:Layout) -> Rect {
		let origin = Point(layout.main.start, layout.cross.start)
		let size = Size(layout.main.size, layout.cross.size)
		return Rect(origin:origin, size:size)
	}

	func convert(vertical layout:Layout) -> Rect {
		let origin = Point(layout.cross.start, layout.main.start)
		let size = Size(layout.cross.size, layout.main.size)
		return Rect(origin:origin, size:size)
	}
}
