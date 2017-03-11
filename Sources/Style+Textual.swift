
public extension Style {

	static let textFont = Attribute<Font>("text.font")
	static let textParagraphStyle = Attribute<ParagraphStyle>("text.paragraphStyle")
	static let textShadow = Attribute<Shadow>("text.shadow")

	// MARK: -

	var textFont:Font? { return get(Style.textFont) }
	var textParagraphStyle:ParagraphStyle? { return get(Style.textParagraphStyle) }
	var textShadow:Shadow? { return get(Style.textShadow) }

	// MARK: -

	static func textFont(_ font:Font) -> Style {
		return Style.textFont.styled(font)
	}

	static func textShadow(_ shadow:Shadow) -> Style {
		return Style.textShadow.styled(shadow)
	}

	static func textParagraphStyle(_ style:ParagraphStyle) -> Style {
		return Style.textParagraphStyle.styled(style)
	}
}
