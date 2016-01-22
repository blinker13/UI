
import CoreGraphics

public struct Color : Equatable {

	public static let clear = Color(white:0.0, alpha:0.0)

	public static let black		= Color(white:0.0)
	public static let darkGray	= Color(white:0.333)
	public static let gray		= Color(white:0.5)
	public static let lightGray	= Color(white:0.667)
	public static let white		= Color(white:1.0)

	// MARK: -

	public enum Components {
		case RGB(Unit, Unit, Unit)
		case Gray(Unit)
	}

	// MARK: -

	public let components:Components
	public let alpha:Unit

	// MARK: -

	public init(components:Components, alpha:Unit) {
		self.alpha = alpha.clamp()
		self.components = components
	}

	public init(white:Unit, alpha:Unit = 1.0) {
		self.init(components:.Gray(white.clamp()), alpha:alpha)
	}

	public init(red:Unit, green:Unit, blue:Unit, alpha:Unit = 1.0) {
		self.init(components:.RGB(red.clamp(), green.clamp(), blue.clamp()), alpha:alpha)
	}
}

// MARK: -

extension Color {
	
	public var red:Unit {
		switch components {
			case let .RGB(r, _, _): return r
			case let .Gray(x): return x
		}
	}

	public var green:Unit {
		switch components {
			case let .RGB(_, g, _): return g
			case let .Gray(x): return x
		}
	}

	public var blue:Unit {
		switch components {
			case let .RGB(_, _, b): return b
			case let .Gray(x): return x
		}
	}
}

// MARK: - Operators

public func == (left:Color, right:Color) -> Bool {
	return (left.alpha == right.alpha && left.components == right.components)
}

public func == (left:Color.Components, right:Color.Components) -> Bool {
	switch (left, right) {
		case (let .RGB(r1, g1, b1), let .RGB(r2, g2, b2)): return r1 == r2 && g1 == g2 && b1 == b2
		case (let .Gray(x1), let .Gray(x2)): return x1 == x2
		default: return false
	}
}
