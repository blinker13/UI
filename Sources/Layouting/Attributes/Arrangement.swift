
public enum Arrangement : String, Codable {
	case horizontal
	case vertical
}

public extension Arrangement {
	var crossed:Arrangement {
		switch self {
			case .horizontal: return .vertical
			case .vertical: return .horizontal
		}
	}
}
