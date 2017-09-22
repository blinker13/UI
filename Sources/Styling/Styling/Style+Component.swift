
import Geometry
import Layouting
import Styling

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

	static func align(_ alignment:Alignment) -> Style {
		return Style(key:Style.alignment, value:alignment)
	}

	static func arrange(_ arrangement:Arrangement) -> Style {
		return Style(key:Style.arrangement, value:arrangement)
	}

	static func distribute(_ distribution:Distribution) -> Style {
		return Style(key:Style.distribution, value:distribution)
	}

	static func justify(_ justify:Alignment) -> Style {
		return Style(key:Style.justify, value:justify)
	}

	static func overflow(_ overflow:Overflow) -> Style {
		return Style(key:Style.overflow, value:overflow)
	}

	static func height(_ height:Axis) -> Style {
		return Style(key:Style.height, value:height)
	}

	static func height(min:Float = 0, max:Float = .infinity) -> Style {
		let axis = Axis(min:min, max:max)
		return height(axis)
	}

	static func width(_ width:Axis) -> Style {
		return Style(key:Style.width, value:width)
	}

	static func width(min:Float = 0, max:Float = .infinity) -> Style {
		let axis = Axis(min:min, max:max)
		return width(axis)
	}

	static func padding(_ padding:Padding) -> Style {
		return Style(key:Style.padding, value:padding)
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
		return Style(key:Style.margin, value:margin)
	}

	static func margin(top:Float = 0, right:Float = 0, bottom:Float = 0, left:Float = 0) -> Style {
		let space = Space(top:top, right:right, bottom:bottom, left:left)
		return margin(space)
	}

	static func margin(horizontal:Float, vertical:Float) -> Style {
		return margin(top:vertical, right:horizontal, bottom:vertical, left:horizontal)
	}

	static func margin(horizontal:Float) -> Style {
		return margin(right:horizontal, left:horizontal)
	}

	static func margin(vertical:Float) -> Style {
		return margin(top:vertical, bottom:vertical)
	}
}
