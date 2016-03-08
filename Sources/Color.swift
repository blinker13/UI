
import CoreGraphics

public struct Color : Equatable {

	public let alpha:Unit
	public let components:Components

	public var red:Unit { return self.components.red }
	public var green:Unit { return self.components.green }
	public var blue:Unit { return self.components.blue }

	// TODO: complement
	public var inverted:Color { return Color(components.inverted, alpha:alpha) }

	// MARK: -

	public init(_ components:Components, alpha:Unit) {
		self.alpha = alpha.percent
		self.components = components
	}

	public init(red:Unit, green:Unit, blue:Unit, alpha:Unit = 1.0) {
		self.init(.RGB(red.percent, green.percent, blue.percent), alpha:alpha)
	}

	public init(white:Unit, alpha:Unit = 1.0) {
		self.init(.Gray(white.percent), alpha:alpha)
	}
}

// MARK: -

extension Color {
	public static let clear = Color(white:0.0, alpha:0.0)

	public static let black		= Color(white:0.0)
	public static let darkGray	= Color(white:0.333)
	public static let gray		= Color(white:0.5)
	public static let lightGray	= Color(white:0.667)
	public static let white		= Color(white:1.0)

	public static let red	= Color(red:1.0, green:0.0, blue:0.0)
	public static let green	= Color(red:0.0, green:1.0, blue:0.0)
	public static let blue	= Color(red:0.0, green:0.0, blue:1.0)

	// TODO: add more default colors
}

// MARK: - CustomStringConvertible

extension Color : CustomStringConvertible {
	public var description:String {
		return "Color(\(components), alpha:\(alpha))"
	}
}

// MARK: - Equatable

public func == (left:Color, right:Color) -> Bool {
	return left.alpha == right.alpha && left.components == right.components
}
