
import Canvas

public struct Style {
	private let attributes:[String:Any?]
	private let styles:[Style]
}

public extension Style {

	init(
		alignment:Alignment? = nil,
		arrangement:Arrangement? = nil,
		background:Color? = nil,
		border:Border? = nil,
		color:Color? = nil,
		distribution:Distribution? = nil,
		height:Dimensions? = nil,
		justify:Alignment? = nil,
		margin:Margin? = nil,
		opacity:Opacity? = nil,
		overflow:Overflow? = nil,
		padding:Padding? = nil,
		shadow:Shadow? = nil,
		width:Dimensions? = nil
	) {
		self.init(attributes:[
			"alignment":alignment,
			"arrangement":arrangement,
			"background":background,
			"border":border,
			"color":color,
			"distribution":distribution,
			"height":height,
			"justify":justify,
			"margin":margin,
			"opacity":opacity,
			"overflow":overflow,
			"padding":padding,
			"shadow":shadow,
			"width":width
		], styles:[])
	}

	subscript (key:String) -> Any? {
		if let value = attributes[key] {
			return value
		}

		for style in styles {
			if let value = style[key] {
				return value
			}
		}

		return nil
	}
}

extension Style : ArrayLiteralConvertible {
	public init(arrayLiteral elements:Style ...) {
		self.init(attributes:[:], styles:elements)
	}
}
