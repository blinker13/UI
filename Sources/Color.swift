
import CoreGraphics

public struct Color : Equatable {

	public enum Components : Equatable {
		case RGB(Unit, Unit, Unit)
		case Gray(Unit)
	}

	public let alpha:Unit
	public let components:Components

	// MARK: -

	public init(_ components:Components, alpha:Unit) {
		self.alpha = alpha.percent
		self.components = components
	}
}

// MARK: -

extension Color {
	
	public init(red:Unit = 0, green:Unit = 0, blue:Unit = 0, alpha:Unit = 1) {
		self.init(.RGB(red.percent, green.percent, blue.percent), alpha:alpha)
	}

	public init(white:Unit, alpha:Unit = 1) {
		self.init(.Gray(white.percent), alpha:alpha)
	}
}

// MARK: - CustomStringConvertible

extension Color.Components : CustomStringConvertible {
	public var description:String {
		switch self {
			case let .RGB(r, g, b): return "red:\(r), green:\(g), blue:\(b)"
			case let .Gray(x): return "gray:\(x)"
		}
	}
}

extension Color : CustomStringConvertible {
	public var description:String {
		return "Color(\(components), alpha:\(alpha))"
	}
}

// MARK: - Equatable

public func == (left:Color.Components, right:Color.Components) -> Bool {
	return left.red == right.red && left.green == right.green && left.blue == right.blue
}

public func == (left:Color, right:Color) -> Bool {
	return left.alpha == right.alpha && left.components == right.components
}
