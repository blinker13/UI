
import Geometry

public struct Color : Hashable {

	public enum Components : Hashable {
		case rgb(Scalar, Scalar, Scalar)
		case hsb(Scalar, Scalar, Scalar)
		case hsl(Scalar, Scalar, Scalar)
		case monochrome(Scalar)
		case named(String)
		case none
	}

	public let components: Components
	public let opacity: Scalar

	@usableFromInline internal init(components: Components, opacity: Scalar) {
		self.components = components
		self.opacity = opacity
	}
}

// MARK: -

extension Color {
	@inlinable public static var clear: Self	{ .init(components: .none, opacity: .zero) }

	@inlinable public static var black: Self	{ .init(white: 0.0) }
	@inlinable public static var gray: Self		{ .init(white: 0.5) }
	@inlinable public static var white: Self	{ .init(white: 1.0) }

	@inlinable public static var red: Self		{ .init(named: #function) }
	@inlinable public static var green: Self	{ .init(named: #function) }
	@inlinable public static var blue: Self		{ .init(named: #function) }
	@inlinable public static var cyan: Self		{ .init(named: #function) }
	@inlinable public static var yellow: Self	{ .init(named: #function) }
	@inlinable public static var magenta: Self	{ .init(named: #function) }
	@inlinable public static var orange: Self	{ .init(named: #function) }
	@inlinable public static var purple: Self	{ .init(named: #function) }
	@inlinable public static var brown: Self	{ .init(named: #function) }

	@inlinable public static var shadow: Self	{ .init(white: .zero, opacity: 0.33) }
}

// MARK: -

extension Color {

	@inlinable public init(red: Scalar, green: Scalar, blue: Scalar, opacity: Scalar = 1.0) {
		self.init(components: .rgb(red, green, blue), opacity: opacity)
	}

	@inlinable public init(hue: Scalar, saturation: Scalar, lightness: Scalar, opacity: Scalar = 1.0) {
		self.init(components: .hsl(hue, saturation, lightness), opacity: opacity)
	}

	@inlinable public init(hue: Scalar, saturation: Scalar, brightness: Scalar, opacity: Scalar = 1.0) {
		self.init(components: .hsb(hue, saturation, brightness), opacity: opacity)
	}

	@inlinable public init(white: Scalar, opacity: Scalar = 1.0) {
		self.init(components: .monochrome(white), opacity: opacity)
	}

	@inlinable public init(named name: String, opacity: Scalar = 1.0) {
		self.init(components: .named(name), opacity: opacity)
	}

	@inlinable public func with(opacity: Scalar) -> Self {
		.init(components: components, opacity: opacity)
	}
}
