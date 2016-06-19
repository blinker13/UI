
public enum Overflow {
	case hidden
	case visible
}

// MARK: -

public extension Overflow {
	var isHidden:Bool { return self == .hidden }
}
