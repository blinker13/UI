
public extension Color {

	static let red		= Color(red:1)
	static let green	= Color(green:1)
	static let blue		= Color(blue:1)
	static let cyan		= Color(green:1, blue:1)
	static let yellow	= Color(red:1, green:1)
	static let magenta	= Color(red:1, blue:1)
	static let orange	= Color(red:1, green:0.5)
	static let purple	= Color(red:0.5, blue:0.5)
	static let brown	= Color(red:0.6, green:0.4, blue:0.2)

	var red:Float { return self.components.red }
	var green:Float { return self.components.green }
	var blue:Float { return self.components.blue }

	init (red:Float = 0, green:Float = 0, blue:Float = 0, alpha:Float = 1) {
		self.components = .rgb(red.clamped(), green.clamped(), blue.clamped())
		self.alpha = alpha.clamped()
	}
}

public extension Color.Components {

	var red:Float {
		switch self {
			case let .rgb(r, _, _): return r
			case let .gray(x): return x
		}
	}

	var green:Float {
		switch self {
			case let .rgb(_, g, _): return g
			case let .gray(x): return x
		}
	}

	var blue:Float {
		switch self {
			case let .rgb(_, _, b): return b
			case let .gray(x): return x
		}
	}
}
