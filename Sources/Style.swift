
public struct Style {
	private let attributes:[String:Any?]
	private let styles:[Style]
}

// MARK: -

extension Style {
	public init(
		alignment:Alignment? = nil,
		height:Dimension? = nil,
		width:Dimension? = nil,
		margin:Space? = nil,
		arrangement:Arrangement? = nil,
		distribution:Distribution? = nil,
		justify:Alignment? = nil,
		padding:Space? = nil,
		background:Color? = nil,
		color:Color? = nil,
		opacity:Unit? = nil,
		border:Border? = nil,
		shadow:Shadow? = nil
	) {
		self.init(attributes:[
			"alignment":alignment,
			"height":height,
			"width":width,
			"margin":margin,
			"arrangement":arrangement,
			"distribution":distribution,
			"justify":justify,
			"padding":padding,
			"background":background,
			"color":color,
			"opacity":opacity,
			"border":border,
			"shadow":shadow
		], styles:[])
	}
}

// MARK: -

extension Style : ArrayLiteralConvertible {
	public init(arrayLiteral elements:Style ...) {
		self.init(attributes:[:], styles:elements)
	}
}

// MARK: -

extension Style {
	public subscript (key:String) -> Any? {
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
