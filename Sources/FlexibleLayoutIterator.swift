
internal struct FlexibleLayoutIterator {

	private let indexes:[Int]
	private let layouts:[ComponentLayout]

	private var stride:StrideToGenerator<Int>

	// MARK: -

	internal init(_ indexes:[Int], _ layouts:[ComponentLayout], _ stride:StrideTo<Int>) {
		self.stride = stride.generate()
		self.layouts = layouts
		self.indexes = indexes
	}
}

// MARK: -

extension FlexibleLayoutIterator : GeneratorType {
	internal mutating func next() -> (Int, ComponentLayout)? {
		guard let strideIndex = stride.next() else { return nil }
		let index = indexes[strideIndex]
		let layout = layouts[index]
		return (index, layout)
	}
}
