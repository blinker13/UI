
public class Node : Hashable, Element {

	private weak var parent:Node?
	private var element:Element

	internal init (with element:Element) {
		self.element = element
	}
}

// MARK: -

public extension Node {

	static func == (left:Node, right:Node) -> Bool {
		return left.hashValue == right.hashValue
	}

	var hashValue:Int {
		let idendifier = ObjectIdentifier(self)
		return idendifier.hashValue
	}
}
