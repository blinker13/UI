
public protocol Textual : Visual {
	var text:Text { get }
}

public extension Textual where Self : Stylable {

	var text:Text { return style.get("text")! }

//	init (style:Style, text:String) {
//		let text = Text(text, attributes:style.textAttributes)
//		self.init(style:style, text:text)
//	}
//
//	init (style:Style, separator:String = " ", _ texts:Text ...) {
//		let text = Text(attributes:style.textAttributes, texts)
//		self.init(style:style, text:text)
//	}
}

public extension Style {
	static func text(_ text:Text) -> Style { return Style(key:"text", value:text) }
	static func textFont(_ font:Font) -> Style { return Style(key:"text.font", value:font) }
	static func textShadow(_ shadow:Shadow) -> Style { return Style(key:"text.shadow", value:shadow) }
	static func textParagraphStyle(_ style:ParagraphStyle) -> Style { return Style(key:"text.paragraphStyle", value:style) }
}

//private extension Style {
//
//	var textAttributes:Text.Attributes {
//		var attributes = Text.Attributes()
//		attributes[Text.font!] = self["text.font"] as? Font ?? .default
//		attributes[Text.forground!] = self["text.color"] as? Color ?? .black
//		attributes[Text.shadow!] = self["text.shadow"] as? Shadow
//		attributes[Text.paragraphStyle!] = textParagraphStyle
//		return attributes
//	}
//
//	var textParagraphStyle:ParagraphStyle {
//		let alignment = self["text.alignment"] as? Text.Alignment ?? .left
//		let lineBreak = self["text.lineBreak"] as? LineBreak ?? .truncateTail
//		return ParagraphStyle(alignment, lineBreak)
//	}
//}
