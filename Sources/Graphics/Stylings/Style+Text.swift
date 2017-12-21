
public extension Style {

	//	static func font(_ font:Font) -> Style {
	//		return Style(key:Text.font, value:font)
	//	}
	//
	//	static func font(name:Font.Name, size:Font.Size, style:Font.Style = .normal, weight:Font.Weight = .regular) -> Style {
	//		let font = Font(name:name, size:size, style:style, weight:weight)
	//		return .font(font)
	//	}
	//
	//	static func paragraphStyle(_ style:ParagraphStyle) -> Style {
	//		return Style(key:Text.paragraphStyle, value:style)
	//	}
	//
	//	static func strikethrough(_ decoration:Text.Decoration) -> Style {
	//		return Text.strikethrough.styled(decoration)
	//	}
	//
	//	static func underline(_ underline:Text.Decoration) -> Style {
	//		return Text.underline.styled(underline)
	//	}

	static func ligatures(_ ligatures:Ligatures) -> Style {
		return Style(key:Text.ligatures, value:ligatures)
	}

	static func textShadow(_ shadow:Shadow) -> Style {
		return Style(key:Text.shadow, value:shadow)
	}

	//	static func stroke(_ stroke:Text.Stroke) -> Style {
	//		return Text.stroke.styled(stroke)
	//	}

	static func kern(_ kern:Float) -> Style {
		return Style(key:Text.kern, value:kern)
	}
}
