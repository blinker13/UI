
internal struct ParentNodeIterator {

	private var node:Node

	// MARK: -

	internal init(_ node:Node) {
		self.node = node
	}
}

// MARK: -

extension ParentNodeIterator : GeneratorType, SequenceType {

	internal mutating func next() -> Node? {
		guard let next = node.parent else { return nil }
		defer { node = next }
		return next
	}
}
