
public extension Style {

	static let alignment = Attribute<Alignment>("alignment")
	static let arrangement = Attribute<Arrangement>("arrangement")
	static let distribution = Attribute<Distribution>("distribution")
	static let justify = Attribute<Alignment>("justify")
	static let overflow = Attribute<Overflow>("overflow")
	static let height = Attribute<Dimensions>("height")
	static let width = Attribute<Dimensions>("width")
	static let padding = Attribute<Padding>("padding")
	static let margin = Attribute<Margin>("margin")

	// MARK: -

	var alignment:Alignment? { return get(Style.alignment) }
	var arrangement:Arrangement? { return get(Style.arrangement) }
	var distribution:Distribution? { return get(Style.distribution) }
	var justify:Alignment? { return get(Style.justify) }
	var overflow:Overflow? { return get(Style.overflow) }
	var height:Dimensions? { return get(Style.height) }
	var width:Dimensions? { return get(Style.width) }
	var padding:Padding? { return get(Style.padding) }
	var margin:Margin? { return get(Style.margin) }

	// MARK: -

	static func alignment(_ alignment:Alignment) -> Style {
		return Style.alignment.styled(alignment)
	}

	static func arrangement(_ arrangement:Arrangement) -> Style {
		return Style.arrangement.styled(arrangement)
	}

	static func distribution(_ distribution:Distribution) -> Style {
		return Style.distribution.styled(distribution)
	}

	static func justify(_ justify:Alignment) -> Style {
		return Style.justify.styled(justify)
	}

	static func overflow(_ overflow:Overflow) -> Style {
		return Style.overflow.styled(overflow)
	}

	static func height(_ height:Dimensions) -> Style {
		return Style.height.styled(height)
	}

	static func height(min:Float = 0, max:Float = .infinity) -> Style {
		let dimensions = Dimensions(min:min, max:max)
		return height(dimensions)
	}

	static func width(_ width:Dimensions) -> Style {
		return Style.width.styled(width)
	}

	static func width(min:Float = 0, max:Float = .infinity) -> Style {
		let dimensions = Dimensions(min:min, max:max)
		return width(dimensions)
	}

	static func padding(_ padding:Padding) -> Style {
		return Style.padding.styled(padding)
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
		return Style.margin.styled(margin)
	}
}
