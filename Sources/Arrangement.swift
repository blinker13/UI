
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

public protocol ArrangementConvertible {
	associatedtype Value
	var horizontal:Value { get }
	var vertical:Value { get }
}

// MARK: -

extension ArrangementConvertible {
	public subscript (arrangement:Arrangement) -> Self.Value {
		switch arrangement {
			case .Horizontal: return horizontal
			case .Vertical: return vertical
		}
	}
}
