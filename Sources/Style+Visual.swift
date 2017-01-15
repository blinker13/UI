
public extension Style {

	static func background(_ color:Color) -> Style {
		return Style(key:"background", value:color)
	}

	static func background(red:Float = 0, green:Float = 0, blue:Float = 0, alpha:Float = 1) -> Style {
		let rgb = Color(red:red, green:green, blue:blue, alpha:alpha)
		return background(rgb)
	}

	static func border(_ border:Border) -> Style {
		return Style(key:"border", value:border)
	}

	static func border(color:Color = .black, radius:Float = 0, width:Float = 0) -> Style {
		let value = Border(color:color, radius:radius, width:width)
		return border(value)
	}

	static func color(_ color:Color) -> Style {
		return Style(key:"color", value:color)
	}

	static func color(red:Float = 0, green:Float = 0, blue:Float = 0, alpha:Float = 1) -> Style {
		let rgb = Color(red:red, green:green, blue:blue, alpha:alpha)
		return color(rgb)
	}

	static func opacity(_ opacity:Opacity) -> Style {
		return Style(key:"opacity", value:opacity)
	}

	static func shadow(_ shadow:Shadow) -> Style {
		return Style(key:"shadow", value:shadow)
	}

	static func shadow(color:Color = .black, offset:Point = .zero, opacity:Float = 0.6, radius:Float = 3) -> Style {
		let shade = Shadow(color:color, offset:offset, opacity:opacity, radius:radius)
		return shadow(shade)
	}
}
