
extension Color {
	public var red:Unit { return self.components.red }
	public var green:Unit { return self.components.green }
	public var blue:Unit { return self.components.blue }
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
