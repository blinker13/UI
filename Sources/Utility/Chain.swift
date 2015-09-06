
internal struct Chain<Item> : Sequence, IteratorProtocol {
	private let body:(Item) -> Item?
	private var base:Item?
}

// MARK: -

internal extension Chain {

	init (_ base:Item?, body:@escaping (Item) -> Item?) {
		(self.base, self.body) = (base, body)
	}

	mutating func next() -> Item? {
		guard let current = base else { return nil }
		defer { base = body(current) }
		return base
	}
}
