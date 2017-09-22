
internal struct Transaction {

	internal enum Commit {
		case insert(Node)
		case update(Node)
		case delete(Node)
	}

	private var nodes:Set<Node>
	private let scene:Scene

	init (with scene:Scene, nodes:Set<Node>) {
		(self.nodes, self.scene) = (nodes, scene)
	}
}

private extension Transaction {

	mutating func nextNode() -> Node? {
		guard let node = nodes.first else { return nil }
		let filteredAncestors = node.ancestors.filter(nodes.contains)
		let next = filteredAncestors.last ?? node
		return nodes.remove(next)
	}
}

extension Transaction : IteratorProtocol, Sequence {

	mutating func next() -> Commit? {
		guard let node = nextNode() else { return nil }

		return nil
	}
}
