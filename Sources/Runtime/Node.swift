
public class Node : Hashable, Element {

	private weak var parent:Node?
	private var children:[Node] = []
	private var model:Element

	internal init (with element:Element) {
		self.model = element
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

	func encode(to encoder:Encoder) throws {
		try model.encode(to:encoder)
	}
}

// MARK: -

internal extension Node {

	func mount() {
		let elements = model.render()
		let nodes = elements.map(realize)
		nodes.forEach { $0.mount() }
		children = nodes
	}

	func unmount() {
		children.forEach { $0.unmount() }
		children.removeAll()
		parent = nil
	}
}

// MARK: -

private extension Node {

	func realize(element:Element) -> Node {
		let node = Node(with:element)
		node.parent = self
		return node
	}
}
