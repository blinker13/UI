
public extension Color.Components {

	var inverted:Color.Components {
		switch self {
			case let .RGB(r, g, b): return .RGB(1.0 - r, 1.0 - g, 1.0 - b)
			case let .Gray(x): return .Gray(1.0 - x)
		}
	}

	// TODO: complementary components
}

// MARK: -

extension Color.Components : CustomStringConvertible {
	public var description:String {
		switch self {
			case let .RGB(r, g, b): return "red:\(r), green:\(g), blue:\(b)"
			case let .Gray(x): return "gray:\(x)"
		}
	}
}

// MARK: -

extension Color.Components {

	public var red:Unit {
		switch self {
			case let .RGB(r, _, _): return r
			case let .Gray(x): return x
		}
	}

	public var green:Unit {
		switch self {
			case let .RGB(_, g, _): return g
			case let .Gray(x): return x
		}
	}

	public var blue:Unit {
		switch self {
			case let .RGB(_, _, b): return b
			case let .Gray(x): return x
		}
	}
}
