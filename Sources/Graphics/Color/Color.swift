
public typealias Alpha = Float
public typealias Opacity = Alpha

public struct Color : Codable, Hashable {

	public enum Components : Hashable {
		case rgb(Float, Float, Float)
		case gray(Float)
	}

	public let alpha:Alpha
	public let components:Components

	public init (_ components:Components, alpha:Alpha = 1.0) {
		self.components = components
		self.alpha = alpha.clamped()
	}
}

public extension Color {

	// TODO: complementary color

	var inverted:Color {
		return Color(components.inverted, alpha:alpha)
	}
}

extension Color : CustomStringConvertible {
	public var description:String {
		return "Color(\(components), alpha:\(alpha))"
	}
}

extension Color : Paint {
	public var isVisible:Bool {
		return alpha > 0
	}
}
