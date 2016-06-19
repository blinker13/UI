
import Canvas

public struct Style {
	private let attributes:[String:Any?]
	private let styles:[Style]
}

extension Style {
	public init(
		alignment:Alignment? = nil,
		arrangement:Arrangement? = nil,
		background:Color? = nil,
		border:Border? = nil,
		color:Color? = nil,
		distribution:Distribution? = nil,
		height:Length? = nil,
		justify:Alignment? = nil,
		margin:Space? = nil,
		opacity:Real? = nil,
		overflow:Overflow? = nil,
		padding:Space? = nil,
		shadow:Shadow? = nil,
		width:Length? = nil
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
}

extension Style : ArrayLiteralConvertible {
	public init(arrayLiteral elements:Style ...) {
		self.init(attributes:[:], styles:elements)
	}
}

public extension Style {
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
