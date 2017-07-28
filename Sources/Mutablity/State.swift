
public final class State<Element> {

	public private(set) var current:Element
	internal var handler:((Scope.Update) -> Void)!

	internal init (with element:Element) {
		self.current = element
	}
}

public extension State {
	func update(with handle:(Element) -> Element) {
		handler { self.current = handle(self.current) }
	}
}
