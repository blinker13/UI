
public protocol Textual : Surface {
	var text:Text { get }
}

public extension Textual {

	func draw(in rect:Rect) -> Composition {
		return .print(text)
	}
}
