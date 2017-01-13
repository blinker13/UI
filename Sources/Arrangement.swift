
public enum Arrangement {
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

public protocol ArrangementCreatable {
	associatedtype ArrangementValue
	init (values:[Arrangement:ArrangementValue])
}

public protocol ArrangementRepresentable {
	associatedtype ArrangementValue
	var horizontal:ArrangementValue { get }
	var vertical:ArrangementValue { get }
}

public extension ArrangementRepresentable {
	subscript (arrangement:Arrangement) -> Self.ArrangementValue {
		switch arrangement {
			case .horizontal: return horizontal
			case .vertical: return vertical
		}
	}
}
