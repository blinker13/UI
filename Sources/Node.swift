
public class Node : Element {

	internal typealias Children = [Node]

	private weak var parent:Node?
	private var children:Children
	private var model:Element

	internal init (with element:Element) {
		self.children = Children()
		self.model = element
	}
}

// MARK: -

public extension Node {
	var alias:Alias { return model.alias }
	var scope:Scope { return model.scope }
}

// MARK: -

internal extension Node {

	func render() -> Children {
		// TODO: apply updates in queue
		let compound = model.render()
		return reconcile(compound)
	}
}

// MARK: -

private extension Node {

	func reconcile(_ compound:Compound) -> Children {
		var reconciler = Reconciler(with:children)
		let elements = compound.enumerated()

		children = elements.map { index, element in

			if let node = reconciler.match(element, at:index) {
				node.model = element
				return node

			} else {
				let node = Node(with:element)
				node.parent = self
				return node
			}
		}

		return children + reconciler.remains.map { node in
			node.parent = nil
			return node
		}
	}
}

// MARK: -

private extension Element {

	func render() -> Compound {

		switch self {
			case let compound as Compound: return compound
			case let component as Component: switch component.render() {
				case let compound as Compound: return compound
				case let element: return [element]
			}
			default: return []
		}
	}
}
