
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

	var hashValue:Int { return idendifier.hashValue }
	var scope:Scope { return model.scope }

	func encode(to encoder:Encoder) throws {
		try model.encode(to:encoder)
	}
}

// MARK: -

internal extension Node {

	func mount() {
		let elements = render()
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

	var idendifier:ObjectIdentifier {
		return ObjectIdentifier(self)
	}

	func realize(element:Element) -> Node {
		let node = Node(with:element)
		node.parent = self
		return node
	}

	func render() -> Children {

		switch model {
			case let children as Children: return children
			case let component as Component: switch component.render() {
				case let children as Children: return children
				case let child: return [child]
			}
			default: return []
		}
	}
}
