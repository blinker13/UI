
import Canvas

public struct Label : Component, Textual, Visual {

	public let style:Style
	public let text:Text

	public init (style:Style, text:Text) {
		(self.style, self.text) = (style, text)
	}
}
