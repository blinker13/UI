
public enum Arrangement {
	case Horizontal
	case Vertical
}

// MARK: -

public extension Arrangement {

	var crossed:Arrangement {
		switch self {
			case .Horizontal: return .Vertical
			case .Vertical: return .Horizontal
		}
	}
}

// MARK: -

public protocol ArrangementCreatable {
	associatedtype ArrangementValue
	init(values:[Arrangement:ArrangementValue])
}

// MARK: -

public protocol ArrangementRepresentable {
	associatedtype ArrangementValue
	var horizontal:ArrangementValue { get }
	var vertical:ArrangementValue { get }
}

// MARK: -

public extension ArrangementRepresentable {
	subscript (arrangement:Arrangement) -> Self.ArrangementValue {
		switch arrangement {
			case .Horizontal: return horizontal
			case .Vertical: return vertical
		}
	}
}
