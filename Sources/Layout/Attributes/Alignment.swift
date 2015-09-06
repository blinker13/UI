
public enum Alignment : String, Codable {
	case leading
	case center
	case trailing
}

internal extension Alignment {

	var factor:Float {
		switch self {
			case .leading: return 0
			case .center: return 0.5
			case .trailing: return 1
		}
	}
}
