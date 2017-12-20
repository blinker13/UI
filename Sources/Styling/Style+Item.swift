
import Geometry
import Layout

public extension Style {

	static func alignment(_ raw:Alignment) -> Style {
		return Style(key:#function, value:raw)
	}

	static func align(_ raw:Alignment) -> Style {
		return alignment(raw)
	}

	static func height(_ raw:Axis) -> Style {
		return Style(key:#function, value:raw)
	}

	static func height(min:Float = 0, max:Float = .infinity) -> Style {
		let raw = Axis(min:min, max:max)
		return height(raw)
	}

	static func width(_ raw:Axis) -> Style {
		return Style(key:#function, value:raw)
	}

	static func width(min:Float = 0, max:Float = .infinity) -> Style {
		let raw = Axis(min:min, max:max)
		return width(raw)
	}

	static func margin(_ raw:Margin) -> Style {
		return Style(key:#function, value:raw)
	}

	static func margin(top:Float = 0, right:Float = 0, bottom:Float = 0, left:Float = 0) -> Style {
		let raw = Space(top:top, right:right, bottom:bottom, left:left)
		return margin(raw)
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

