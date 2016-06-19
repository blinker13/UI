
import CoreGraphics

public struct Color : Equatable {

	public enum Components : Equatable {
		case rgb(Unit, Unit, Unit)
		case gray(Unit)
	}

	public let alpha:Unit
	public let components:Components

	public init(_ components:Components, alpha:Unit) {
		self.alpha = alpha.percent
		self.components = components
	}
}

// MARK: -

public extension Color {

	static let clear	= Color(white:0, alpha:0)
	
	static let black		= Color(white:0)
	static let darkGray		= Color(white:0.333)
	static let gray			= Color(white:0.5)
	static let lightGray	= Color(white:0.667)
	static let white		= Color(white:1)

	static let red		= Color(red:1)
	static let green	= Color(green:1)
	static let blue		= Color(blue:1)
	static let cyan		= Color(green:1, blue:1)
	static let yellow	= Color(red:1, green:1)
	static let magenta	= Color(red:1, blue:1)
	static let orange	= Color(red:1, green:0.5)
	static let purple	= Color(red:0.5, blue:0.5)
	static let brown	= Color(red:0.6, green:0.4, blue:0.2)

	// TODO: complementary color

	var inverted:Color { return Color(components.inverted, alpha:alpha) }

	var red:Unit { return self.components.red }
	var green:Unit { return self.components.green }
	var blue:Unit { return self.components.blue }

	init(red:Unit = 0, green:Unit = 0, blue:Unit = 0, alpha:Unit = 1) {
		self.init(.rgb(red.percent, green.percent, blue.percent), alpha:alpha)
	}

	init(white:Unit, alpha:Unit = 1) {
		self.init(.gray(white.percent), alpha:alpha)
	}
}

// MARK: -

extension Color : CustomStringConvertible {
	public var description:String {
		return "Color(\(components), alpha:\(alpha))"
	}
}

// MARK: -

public func == (left:Color.Components, right:Color.Components) -> Bool {
	return left.red == right.red && left.green == right.green && left.blue == right.blue
}

public func == (left:Color, right:Color) -> Bool {
	return left.alpha == right.alpha && left.components == right.components
}
