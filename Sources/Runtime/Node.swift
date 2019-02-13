
import Core

open class Node : Hashable {

	private weak var parent:Node?
	private var children:[Node]?

	internal private(set) var model:Element

	public init (with element:Element) {
		let renderer = Renderer(node:self)
		try! element.encode(to: renderer)
	}

	open func mount() -> Node {
		precondition(children == nil)
		children = reconcile()
		return self
	}

	open func unmount() {
		precondition(children != nil)
		children?.forEach { $0.unmount() }
		children = nil
		parent = nil
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

	subscript <Kind>(key:String) -> Kind? {
		return model[key] as? Kind
	}
}

// MARK: -

internal extension Node {

	var ancestors:Chain<Node> {
		return Chain(parent) { $0.parent }
	}
}

// MARK: -

private extension Node {

	func reconcile() -> [Node] {
		guard let value = model["children"] else { return [] }
		guard let kids = value as? [Element] else { return [] }
		model.removeValue(forKey:"childen")
		return kids.map(realize)
	}

	func realize(element:Element) -> Node {
		let node = Node(with:element)
		node.parent = self
		return node
	}
}
