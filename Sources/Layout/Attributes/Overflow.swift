
public enum Overflow : String, Codable {
	case show
	case hide
}

public extension Overflow {
	var isVisible:Bool { return self == .show }
	var isHidden:Bool { return self == .hide }
}

extension Overflow : ExpressibleByBooleanLiteral {

	public init (booleanLiteral value:Bool) {
		self = value ? .show : .hide
	}
}
