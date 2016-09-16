
internal struct FlexibleLayoutEnumerator {

	fileprivate let indexes:[Int]
	fileprivate let layouts:[ComponentLayout]
	fileprivate let strideTo:StrideTo<Int>

	internal init(_ indexes:[Int], _ layouts:[ComponentLayout], reversed:Bool) {
		let start = reversed ? indexes.endIndex - 1 : indexes.startIndex
		let end = reversed ? indexes.startIndex - 1 : indexes.endIndex
		let distance = reversed ? -1 : 1
		self.strideTo = stride(from:start, to:end, by:distance)
		self.layouts = layouts
		self.indexes = indexes
	}
}

internal extension FlexibleLayoutEnumerator {
	var count:Int { return layouts.count }
}

extension FlexibleLayoutEnumerator : Sequence {
	internal func makeIterator() -> FlexibleLayoutIterator {
		return FlexibleLayoutIterator(indexes, layouts, strideTo)
	}
}
