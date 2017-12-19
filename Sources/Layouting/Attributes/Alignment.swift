
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

	func enumerate(for count:Int) -> StrideTo<Int> {
		if self == .trailing { return stride(from:count - 1, to:-1, by:-1) }
		else { return stride(from:0, to:count, by:1) }
	}
}
