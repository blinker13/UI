
internal struct ItemEnumerator {
	private let strideTo:StrideTo<Int>
	private let items:[Item]
}

internal extension ItemEnumerator {

	var count:Int { return items.count }

	init (with items:[Item], reversed:Bool) {
		let start = reversed ? items.endIndex - 1 : items.startIndex
		let end = reversed ? items.startIndex - 1 : items.endIndex
		let distance = reversed ? -1 : 1

		self.strideTo = stride(from:start, to:end, by:distance)
		self.items = items
	}
}

extension ItemEnumerator : Sequence {
	internal func makeIterator() -> ItemIterator {
		return ItemIterator(items, to:strideTo)
	}
}
