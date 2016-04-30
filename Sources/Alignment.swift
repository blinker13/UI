
public enum Alignment {
	case Leading
	case Center
	case Trailing
//	case Natural
}

// MARK: -

extension Alignment {
	internal func calculateOffset(with remainder:Unit) -> Unit {
		switch self {
			case .Leading: return 0
			case .Center: return remainder / 2
			case .Trailing: return remainder
		}
	}
}

// MARK: -

public protocol AlignmentRepresentable {
	associatedtype AlignmentValue
	var leading:AlignmentValue { get }
	var center:AlignmentValue { get }
	var trailing:AlignmentValue { get }
}

// MARK: -

extension AlignmentRepresentable {
	public subscript (alignment:Alignment) -> Self.AlignmentValue {
		switch alignment {
			case .Leading: return leading
			case .Center: return center
			case .Trailing: return trailing
		}
	}
}
