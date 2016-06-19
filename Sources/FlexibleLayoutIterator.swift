
internal struct FlexibleLayoutIterator {

	private let indexes:[Int]
	private let layouts:[ComponentLayout]

	private var stride:StrideToIterator<Int>

	internal init(_ indexes:[Int], _ layouts:[ComponentLayout], _ stride:StrideTo<Int>) {
		self.stride = stride.makeIterator()
		self.layouts = layouts
		self.indexes = indexes
	}
}

extension FlexibleLayoutIterator : IteratorProtocol {
	internal mutating func next() -> (Int, ComponentLayout)? {
		guard let strideIndex = stride.next() else { return nil }
		let index = indexes[strideIndex]
		let layout = layouts[index]
		return (index, layout)
	}
}
