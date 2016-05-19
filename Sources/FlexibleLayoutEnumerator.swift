
internal struct FlexibleLayoutEnumerator {

	private let indexes:[Int]
	private let layouts:[ComponentLayout]
	private let strideTo:StrideTo<Int>

	// MARK: -

	internal init(_ indexes:[Int], _ layouts:[ComponentLayout], reversed:Bool) {
		let start = reversed ? indexes.endIndex - 1 : indexes.startIndex
		let end = reversed ? indexes.startIndex - 1 : indexes.endIndex
		let distance = reversed ? -1 : 1
		self.strideTo = start.stride(to:end, by:distance)
		self.layouts = layouts
		self.indexes = indexes
	}
}

// MARK: -

extension FlexibleLayoutEnumerator {
	internal var count:Int {
		return layouts.count
	}
}

// MARK: - Sequence

extension FlexibleLayoutEnumerator : SequenceType {
	internal func generate() -> FlexibleLayoutIterator {
		return FlexibleLayoutIterator(indexes, layouts, strideTo)
	}
}
