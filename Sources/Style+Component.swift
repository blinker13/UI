
public extension Style {

	static func alignment(_ alignment:Alignment) -> Style {
		return Style(key:"alignment", value:alignment)
	}

	static func arrangement(_ arrangement:Arrangement) -> Style {
		return Style(key:"arrangement", value:arrangement)
	}

	static func distribution(_ distribution:Distribution) -> Style {
		return Style(key:"distribution", value:distribution)
	}

	static func justify(_ justify:Alignment) -> Style {
		return Style(key:"justify", value:justify)
	}

	static func overflow(_ overflow:Overflow) -> Style {
		return Style(key:"overflow", value:overflow)
	}

	static func height(_ height:Dimensions) -> Style {
		return Style(key:"height", value:height)
	}

	static func height(min:Float = 0, max:Float = .infinity) -> Style {
		let dimensions = Dimensions(min:min, max:max)
		return height(dimensions)
	}

	static func width(_ width:Dimensions) -> Style {
		return Style(key:"width", value:width)
	}

	static func width(min:Float = 0, max:Float = .infinity) -> Style {
		let dimensions = Dimensions(min:min, max:max)
		return width(dimensions)
	}

	static func padding(_ padding:Padding) -> Style {
		return Style(key:"padding", value:padding)
	}

	static func padding(top:Float = 0, left:Float = 0, bottom:Float = 0, right:Float = 0) -> Style {
		let space = Space(top:top, left:left, bottom:bottom, right:right)
		return padding(space)
	}

	static func padding(horizontal:Float, vertical:Float) -> Style {
		return padding(top:vertical, left:horizontal, bottom:vertical, right:horizontal)
	}

	static func padding(horizontal:Float) -> Style {
		return padding(left:horizontal, right:horizontal)
	}

	static func padding(vertical:Float) -> Style {
		return padding(top:vertical, bottom:vertical)
	}

	static func margin(_ margin:Margin) -> Style {
		return Style(key:"margin", value:margin)
	}

	var alignment:Alignment? { return get("alignment") }
	var arrangement:Arrangement? { return get("arrangement") }
	var distribution:Distribution? { return get("distribution") }
	var justify:Alignment? { return get("justify") }
	var overflow:Overflow? { return get("overflow") }
	var height:Dimensions? { return get("height") }
	var width:Dimensions? { return get("width") }
	var padding:Padding? { return get("padding") }
	var margin:Margin? { return get("margin") }

}
