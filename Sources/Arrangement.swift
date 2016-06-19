
public enum Arrangement {
	case horizontal
	case vertical
}

// MARK: -

public extension Arrangement {

	var crossed:Arrangement {
		switch self {
			case .horizontal: return .vertical
			case .vertical: return .horizontal
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
			case .horizontal: return horizontal
			case .vertical: return vertical
		}
	}
}
