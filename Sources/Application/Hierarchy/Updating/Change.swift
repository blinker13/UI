
internal struct Change {

	internal enum Kind : Equatable {
		case insert(Int)
		case move(Int)
		case update
		case remove
	}

	internal let kind:Kind
	internal let node:Node
}

// MARK: -

internal extension Change {

	init (insert node:Node, at index:Int) {
		self.kind = .insert(index)
		self.node = node
	}

	init (move node:Node, to index:Int) {
		self.kind = .move(index)
		self.node = node
	}

	init (update node:Node) {
		self.kind = .update
		self.node = node
	}

	init (remove node:Node) {
		self.kind = .remove
		self.node = node
	}
}

// MARK: -

internal extension Change.Kind {

	static func == (left:Change.Kind, right:Change.Kind) -> Bool {

		switch (left, right) {
			case let (.insert(l), .insert(r)): return l == r
			case let (.move(l), .move(r)): return l == r
			case (.remove, .remove): return true
			default: return false
		}
	}
}
