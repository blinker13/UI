
public enum Overflow : String, Codable {
	case hidden
	case visible
}

public extension Overflow {

	var isHidden:Bool {
		return self == .hidden
	}

	var isVisible:Bool {
		return self == .visible
	}
}

extension Overflow : ExpressibleByBooleanLiteral {

	public init (booleanLiteral value:Bool) {
		self = value ? .visible : .hidden
	}
}

//extension Overflow : Boolean {
//	public var boolValue:Bool {
//		return self == .visible
//	}
//}
