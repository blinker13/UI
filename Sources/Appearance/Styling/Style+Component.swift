
public extension Style {

	static let alignment = Attribute<Alignment>("alignment")
	static let arrangement = Attribute<Arrangement>("arrangement")
	static let distribution = Attribute<Distribution>("distribution")
	static let justify = Attribute<Alignment>("justify")
	static let overflow = Attribute<Overflow>("overflow")
	static let padding = Attribute<Padding>("padding")
	static let margin = Attribute<Margin>("margin")
	static let height = Attribute<Axis>("height")
	static let width = Attribute<Axis>("width")

	// MARK: -

	var alignment:Alignment? { return get(Style.alignment) }
	var arrangement:Arrangement? { return get(Style.arrangement) }
	var distribution:Distribution? { return get(Style.distribution) }
	var justify:Alignment? { return get(Style.justify) }
	var overflow:Overflow? { return get(Style.overflow) }
	var padding:Padding? { return get(Style.padding) }
	var margin:Margin? { return get(Style.margin) }
	var height:Axis? { return get(Style.height) }
	var width:Axis? { return get(Style.width) }

	// MARK: -

	static func align(_ alignment:Alignment) -> Style {
		return Style.alignment.styled(alignment)
	}

	static func arrange(_ arrangement:Arrangement) -> Style {
		return Style.arrangement.styled(arrangement)
	}

	static func distribute(_ distribution:Distribution) -> Style {
		return Style.distribution.styled(distribution)
	}

	static func justify(_ justify:Alignment) -> Style {
		return Style.justify.styled(justify)
	}

	static func overflow(_ overflow:Overflow) -> Style {
		return Style.overflow.styled(overflow)
	}

	static func height(_ height:Axis) -> Style {
		return Style.height.styled(height)
	}

	static func height(min:Float = 0, max:Float = .infinity) -> Style {
		let axis = Axis(start:min, end:max)
		return height(axis)
	}

	static func width(_ width:Axis) -> Style {
		return Style.width.styled(width)
	}

	static func width(min:Float = 0, max:Float = .infinity) -> Style {
		let axis = Axis(start:min, end:max)
		return width(axis)
	}

	static func padding(_ padding:Padding) -> Style {
		return Style.padding.styled(padding)
	}

	static func padding(top:Float = 0, right:Float = 0, bottom:Float = 0, left:Float = 0) -> Style {
		let space = Space(top:top, right:right, bottom:bottom, left:left)
		return padding(space)
	}

	static func padding(horizontal:Float, vertical:Float) -> Style {
		return padding(top:vertical, right:horizontal, bottom:vertical, left:horizontal)
	}

	static func padding(horizontal:Float) -> Style {
		return padding(right:horizontal, left:horizontal)
	}

	static func padding(vertical:Float) -> Style {
		return padding(top:vertical, bottom:vertical)
	}

	static func margin(_ margin:Margin) -> Style {
		return Style.margin.styled(margin)
	}
}
