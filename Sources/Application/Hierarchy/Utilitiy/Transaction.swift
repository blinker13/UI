
internal struct Transaction : Sequence, IteratorProtocol {

	private var nodes:Set<Node>

	internal init (with nodes:Set<Node>) {
		self.nodes = nodes
	}
}

internal extension Transaction {

	mutating func next() -> Commit? {
		guard let node = dequeue() else { return nil }
		let element = node.render()

		var changes = ChangeSet(with:node.children)
		var children = [Node]()

		for (index, renderer) in element.children.enumerated() {

			if let match = changes.match(renderer) {
				children.append(match.node)
				match.node.renderer = renderer
				enqueue(match.node)//TODO: soft update

				if match.origin == index || changes.skip(index) { continue }
				changes.move(match.node, to:index)

			} else {//TODO: check current child for type conformance
				let new = Node(with:renderer)
				changes.insert(new, at:index)
				children.append(new)
				enqueue(new)
			}
		}

		for change in changes.deletions {
			nodes.remove(change.node)
		}

		node.children = children
		return Commit(changes:changes, node:node)
	}
}

// MARK: -

private extension Transaction {

	mutating func dequeue() -> Node? {
		guard let node = nodes.first else { return nil }
		let filteredNodes = node.ancestors.filter(nodes.contains)
		let next = filteredNodes.last ?? node
		return nodes.remove(next)
	}

	mutating func enqueue(_ node:Node) {
		nodes.insert(node)
	}
}
