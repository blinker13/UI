
internal struct ItemIterator {
	private var stride:StrideToIterator<Int>
	private let items:[Item]
}

internal extension ItemIterator {
	init (_ items:[Item], to stride:StrideTo<Int>) {
		self.stride = stride.makeIterator()
		self.items = items
	}
}

extension ItemIterator : IteratorProtocol {
	internal mutating func next() -> Item? {
		guard let index = stride.next() else { return nil }
		return items[index]
	}
}
