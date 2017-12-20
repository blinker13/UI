
import Geometry
import Layout

public extension Style {

	static func arrangement(_ raw:Arrangement) -> Style {
		return Style(key:#function, value:raw)
	}

	static func arrange(_ raw:Arrangement) -> Style {
		return arrangement(raw)
	}

	static func distribution(_ raw:Distribution) -> Style {
		return Style(key:#function, value:raw)
	}

	static func distribute(_ raw:Distribution) -> Style {
		return distribution(raw)
	}

	static func justify(_ raw:Alignment) -> Style {
		return Style(key:#function, value:raw)
	}

	static func padding(_ raw:Padding) -> Style {
		return Style(key:#function, value:raw)
	}

	static func padding(top:Float = 0, right:Float = 0, bottom:Float = 0, left:Float = 0) -> Style {
		let raw = Space(top:top, right:right, bottom:bottom, left:left)
		return padding(raw)
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
}
