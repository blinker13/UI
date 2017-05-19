
public struct Label : Textual, View {

	public let style:Style
	public let text:Text

	public init (style:Style, text:Text) {
		self.style = style
		self.text = text
	}
}
