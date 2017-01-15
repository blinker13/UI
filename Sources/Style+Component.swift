
public extension Style {

	static func alignment(_ alignment:Alignment) -> Style {
		return Style(key:"alignment", value:alignment)
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

	static func margin(_ margin:Margin) -> Style {
		return Style(key:"margin", value:margin)
	}
}
