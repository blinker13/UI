
public extension Text {

	public enum Alignment {
		case left
		case center
		case right
		case justified
		case natural
	}

	public enum Direction {
		case leftToRight
		case rightToLeft
		case natural
	}
}

public extension Text {
	static let font = Attribute<Font>("text.font")
	static let paragraphStyle = Attribute<ParagraphStyle>("text.paragraphStyle")
	static let strikethrough = Attribute<Text.Decoration>("text.strikethrough")
	static let underline = Attribute<Text.Decoration>("text.underline")
	static let ligatures = Attribute<Bool>("text.ligatures")
	static let shadow = Attribute<Shadow>("text.shadow")
	static let stroke = Attribute<Text.Stroke>("text.stroke")
	static let kern = Attribute<Float>("text.kern")
}

public extension Style {

	static func font(_ font:Font) -> Style {
		return Text.font.styled(font)
	}

	static func paragraphStyle(_ style:ParagraphStyle) -> Style {
		return Text.paragraphStyle.styled(style)
	}

	static func strikethrough(_ decoration:Text.Decoration) -> Style {
		return Text.strikethrough.styled(decoration)
	}

	static func underline(_ underline:Text.Decoration) -> Style {
		return Text.underline.styled(underline)
	}

	static func ligatures(_ ligatures:Bool) -> Style {
		return Text.ligatures.styled(ligatures)
	}

	static func textShadow(_ shadow:Shadow) -> Style {
		return Text.shadow.styled(shadow)
	}

	static func stroke(_ stroke:Text.Stroke) -> Style {
		return Text.stroke.styled(stroke)
	}

	static func kern(_ kern:Float) -> Style {
		return Text.kern.styled(kern)
	}
}
