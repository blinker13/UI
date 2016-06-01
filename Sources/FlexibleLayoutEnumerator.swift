
internal struct FlexibleLayoutEnumerator {

	private let indexes:[Int]
	private let layouts:[ComponentLayout]
	private let strideTo:StrideTo<Int>

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

internal extension FlexibleLayoutEnumerator {
	var count:Int { return layouts.count }
}

// MARK: -

extension FlexibleLayoutEnumerator : SequenceType {
	internal func generate() -> FlexibleLayoutIterator {
		return FlexibleLayoutIterator(indexes, layouts, strideTo)
	}
}
