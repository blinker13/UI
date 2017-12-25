
internal struct Ancestors : Sequence, IteratorProtocol {

	internal var current:Node?

	mutating func next() -> Node? {
		current = current?.parent
		return current
	}
}
