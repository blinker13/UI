
import Geometry
import Canvas

public struct Style {
	public typealias Attribute = String
	fileprivate let attributes:[Attribute:Any?]
	fileprivate let styles:[Style]
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
		textAlignment:Text.Alignment? = nil,
		textColor:Color? = nil,
		textFont:Font? = nil,
		textLineBreak:LineBreak? = nil,
		textShadow:Shadow? = nil,
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
			"text.alignment":textAlignment,
			"text.color":textColor,
			"text.font":textFont,
			"text.lineBreak":textLineBreak,
			"text.shadow":textShadow,
			"width":width
		], styles:[])
	}

	subscript (key:Attribute) -> Any? {
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

extension Style : ExpressibleByArrayLiteral {
	public init(arrayLiteral elements:Style ...) {
		self.init(attributes:[:], styles:elements)
	}
}

//extension Style : DictionaryLiteralConvertible {
//	init(dictionaryLiteral elements:(Attribute, Any?) ...) {
//		let attributes = Dictionary(elements)
//		self.init(attributes:attributes, styles:[])
//	}
//}
