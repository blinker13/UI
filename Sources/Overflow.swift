
public enum Overflow {
	case hidden
	case visible
}

public extension Overflow {
	var isHidden:Bool { return self == .hidden }
}

extension Overflow : ExpressibleByBooleanLiteral {
	public init(booleanLiteral value:Bool) {
		self = value ? .visible : .hidden
	}
}

//extension Overflow : Boolean {
//	public var boolValue:Bool {
//		return self == .visible
//	}
//}
