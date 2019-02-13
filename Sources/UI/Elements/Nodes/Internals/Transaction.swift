
import Runtime

internal struct Transaction : Sequence, IteratorProtocol {
	private var nodes:Set<Node> = []
}

// MARK: -

internal extension Transaction {

	func contains(_ element:Node) -> Bool {
		return nodes.contains(element)
	}

	mutating func next() -> Node? {
		guard let node = first else { return nil }
		return nodes.remove(node)
	}

	mutating func commit(_ node:Node) {
		nodes.insert(node)
	}
}

// MARK: -

private extension Transaction {

	var first:Node? {
		guard let node = nodes.first else { return nil }
		let ancestors = node.ancestors.filter(contains)
		return ancestors.last ?? node
	}
}
