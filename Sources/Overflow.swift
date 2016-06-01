
public enum Overflow {
	case Hidden
	case Visible
}

// MARK: -

public extension Overflow {
	var isHidden:Bool { return self == .Hidden }
}
