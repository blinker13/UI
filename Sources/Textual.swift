
public protocol Textual : Surface, Visual {
	var text:Text { get }
}

public extension Textual {

	func draw(in rect:Rect) -> Composition {
		return .empty
	}
}

//public extension Textual where Self : Stylable {
//
//	init (style:Style, text:String) {
//		let text = Text(text, attributes:style.textAttributes)
//		self.init(style:style, text:text)
//	}
//
//	init (style:Style, separator:String = " ", _ texts:Text ...) {
//		let text = Text(attributes:style.textAttributes, texts)
//		self.init(style:style, text:text)
//	}
//}

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
