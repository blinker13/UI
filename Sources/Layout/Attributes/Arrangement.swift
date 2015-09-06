
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
