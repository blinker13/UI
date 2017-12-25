
internal struct TreeIterator<Element> : Sequence, IteratorProtocol {

	private let body:(Element) -> Element?
	private var base:Element?

	internal init(_ base:Element?, body:@escaping (Element) -> Element?) {
		(self.base, self.body) = (base, body)
	}

	internal mutating func next() -> Element? {
		guard let current = base else { return nil }
		defer { base = body(current) }
		return base
	}
}
