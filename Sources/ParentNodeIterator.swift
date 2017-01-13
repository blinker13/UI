
internal struct ParentNodeIterator {

	fileprivate var node:Node

	internal init (_ node:Node) {
		self.node = node
	}
}

extension ParentNodeIterator : IteratorProtocol, Sequence {
	internal mutating func next() -> Node? {
		guard let next = node.parent else { return nil }
		defer { node = next }
		return next
	}
}
