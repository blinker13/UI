
public enum Arrangement {
	case Horizontal
	case Vertical
}

// MARK: -

extension Arrangement {
	public var crossed:Arrangement {
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

extension ArrangementRepresentable {
	public subscript (arrangement:Arrangement) -> Self.ArrangementValue {
		switch arrangement {
			case .Horizontal: return horizontal
			case .Vertical: return vertical
		}
	}
}
