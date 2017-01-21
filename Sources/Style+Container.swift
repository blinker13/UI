
public extension Style {

	static func arrangement(_ arrangement:Arrangement) -> Style {
		return Style(key:"arrangement", value:arrangement)
	}

	static func distribution(_ distribution:Distribution) -> Style {
		return Style(key:"distribution", value:distribution)
	}

	static func justify(_ justify:Alignment) -> Style {
		return Style(key:"justify", value:justify)
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
}
