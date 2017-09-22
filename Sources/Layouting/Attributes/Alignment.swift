
public enum Alignment : String, Codable {
	case leading
	case center
	case trailing
}

internal extension Alignment {
	func calculateOffset(with remainder:Float) -> Float {
		switch self {
			case .leading: return 0
			case .center: return remainder / 2
			case .trailing: return remainder
		}
	}
}
