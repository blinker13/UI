
import Geometry
import Graphics

public extension Style {

	static func background(_ raw:Color) -> Style {
		return Style(key:#function, value:raw)
	}

	static func background(red:Float = 0, green:Float = 0, blue:Float = 0, alpha:Float = 1) -> Style {
		let raw = Color(red:red, green:green, blue:blue, alpha:alpha)
		return background(raw)
	}
}

// MARK: -

public extension Style {

	static func border(_ raw:Border) -> Style {
		return Style(key:#function, value:raw)
	}

	static func border(color:Color = .black, radius:Float = 0, width:Float = 0) -> Style {
		let raw = Border(color:color, radius:radius, width:width)
		return border(raw)
	}
}

// MARK: -

public extension Style {

	static func opacity(_ raw:Opacity) -> Style {
		return Style(key:#function, value:raw)
	}
}

// MARK: -

public extension Style {

	static func shadow(_ raw:Shadow) -> Style {
		return Style(key:#function, value:raw)
	}

	static func shadow(color:Color = .black, offset:Point = .zero, opacity:Float = 0.6, radius:Float = 3) -> Style {
		let raw = Shadow(color:color, offset:offset, opacity:opacity, radius:radius)
		return shadow(raw)
	}
}

// MARK: -

public extension Style {

	static func tint(_ raw:Color) -> Style {
		return Style(key:#function, value:raw)
	}

	static func tint(red:Float = 0, green:Float = 0, blue:Float = 0, alpha:Float = 1) -> Style {
		let raw = Color(red:red, green:green, blue:blue, alpha:alpha)
		return tint(raw)
	}
}
