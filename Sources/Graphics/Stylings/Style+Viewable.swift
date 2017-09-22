
import Geometry
import Styling

public extension Style {

	static let background = Attribute<Color>("background")
	static let border = Attribute<Border>("border")
	static let opacity = Attribute<Opacity>("opacity")
	static let shadow = Attribute<Shadow>("shadow")
	static let tint = Attribute<Color>("tint")

	// MARK: -

	var background:Color? { return self[Style.background] }
	var border:Border? { return self[Style.border] }
	var opacity:Opacity? { return self[Style.opacity] }
	var shadow:Shadow? { return self[Style.shadow] }
	var tint:Color? { return self[Style.tint] }

	// MARK: -

	static func background(_ color:Color) -> Style {
		return Style(key:Style.background, value:color)
	}

	static func background(red:Float = 0, green:Float = 0, blue:Float = 0, alpha:Float = 1) -> Style {
		let rgb = Color(red:red, green:green, blue:blue, alpha:alpha)
		return background(rgb)
	}

	static func border(_ border:Border) -> Style {
		return Style(key:Style.border, value:border)
	}

	static func border(color:Color = .black, radius:Float = 0, width:Float = 0) -> Style {
		let value = Border(color:color, radius:radius, width:width)
		return border(value)
	}

	static func tint(_ color:Color) -> Style {
		return Style(key:Style.tint, value:color)
	}

	static func tint(red:Float = 0, green:Float = 0, blue:Float = 0, alpha:Float = 1) -> Style {
		let rgb = Color(red:red, green:green, blue:blue, alpha:alpha)
		return tint(rgb)
	}

	static func opacity(_ opacity:Opacity) -> Style {
		return Style(key:Style.opacity, value:opacity)
	}

	static func shadow(_ shadow:Shadow) -> Style {
		return Style(key:Style.shadow, value:shadow)
	}

	static func shadow(color:Color = .black, offset:Point = .zero, opacity:Float = 0.6, radius:Float = 3) -> Style {
		let shade = Shadow(color:color, offset:offset, opacity:opacity, radius:radius)
		return shadow(shade)
	}
}
