
import Geometry

public enum Alignment {
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

public protocol AlignmentRepresentable {
	associatedtype AlignmentValue
	var leading:AlignmentValue { get }
	var center:AlignmentValue { get }
	var trailing:AlignmentValue { get }
}

public extension AlignmentRepresentable {
	subscript (alignment:Alignment) -> Self.AlignmentValue {
		switch alignment {
			case .leading: return leading
			case .center: return center
			case .trailing: return trailing
		}
	}
}
