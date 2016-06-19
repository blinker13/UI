
internal struct ParentNodeIterator {

	private var node:Node

	internal init(_ node:Node) {
		self.node = node
	}
}

// MARK: -

extension ParentNodeIterator : IteratorProtocol, Sequence {

	internal mutating func next() -> Node? {
		guard let next = node.parent else { return nil }
		defer { node = next }
		return next
	}
}
