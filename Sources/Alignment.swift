
public enum Alignment {
	case leading
	case center
	case trailing
//	case Natural
}

// MARK: -

internal extension Alignment {
	func calculateOffset(with remainder:Unit) -> Unit {
		switch self {
			case .leading: return 0
			case .center: return remainder / 2
			case .trailing: return remainder
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

public extension AlignmentRepresentable {
	subscript (alignment:Alignment) -> Self.AlignmentValue {
		switch alignment {
			case .leading: return leading
			case .center: return center
			case .trailing: return trailing
		}
	}
}
