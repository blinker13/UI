
extension Color {
	// TODO: complementary color
	public var inverted:Color { return Color(components.inverted, alpha:alpha) }
}

// MARK: -

extension Color.Components {

	// TODO: complementary components

	public var inverted:Color.Components {
		switch self {
		case let .RGB(r, g, b): return .RGB(1.0 - r, 1.0 - g, 1.0 - b)
		case let .Gray(x): return .Gray(1.0 - x)
		}
	}
}
