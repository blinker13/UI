
public enum Overflow {
	case Hidden
	case Visible
}

// MARK: -

extension Overflow {
	public var isHidden:Bool {
		return self == .Hidden
	}
}
