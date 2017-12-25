
import Geometry
import Layout

public extension Style {

	static func arrangement(_ raw:Arrangement) -> Style {
		return Style(key:#function, value:raw)
	}

	static func arrange(_ raw:Arrangement) -> Style {
		return arrangement(raw)
	}
}

// MARK: -

public extension Style {

	static func distribution(_ raw:Distribution) -> Style {
		return Style(key:#function, value:raw)
	}

	static func distribute(_ raw:Distribution) -> Style {
		return distribution(raw)
	}
}

// MARK: -

public extension Style {

	static func justify(_ raw:Alignment) -> Style {
		return Style(key:#function, value:raw)
	}
}

// MARK: -

public extension Style {

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

// MARK: -

public extension Style {

	static func alignment(_ raw:Alignment) -> Style {
		return Style(key:#function, value:raw)
	}

	static func align(_ raw:Alignment) -> Style {
		return alignment(raw)
	}
}

// MARK: -

public extension Style {

	static func height(_ raw:Axis) -> Style {
		return Style(key:#function, value:raw)
	}

	static func height(min:Float = 0, max:Float = .infinity) -> Style {
		let raw = Axis(min:min, max:max)
		return height(raw)
	}

	static func height(_ size:Float) -> Style {
		let raw = Axis(min:size, max:size)
		return height(raw)
	}
}

// MARK: -

public extension Style {

	static func width(_ raw:Axis) -> Style {
		return Style(key:#function, value:raw)
	}

	static func width(min:Float = 0, max:Float = .infinity) -> Style {
		let raw = Axis(min:min, max:max)
		return width(raw)
	}

	static func width(_ size:Float) -> Style {
		let raw = Axis(min:size, max:size)
		return width(raw)
	}
}

// MARK: -

public extension Style {

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

// MARK: -

public extension Style {

	static func overflow(_ raw:Overflow) -> Style {
		return Style(key:#function, value:raw)
	}
}
