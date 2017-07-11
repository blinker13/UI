
public final class State<Element> {

	public private(set) var current:Element

	internal weak var scene:Scene!
	internal weak var node:Node!

	internal init (with element:Element) {
		self.current = element
	}
}

public extension State {

	func update(with handle:(Element) -> Element) {
		print("========================")
		print("will update", current)

		current = handle(current)
		scene.mark(node)

		print("->", current)
	}
}
