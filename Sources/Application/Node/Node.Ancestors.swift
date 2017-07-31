
internal extension Node {

	internal final class Ancestors {

		fileprivate var current:Node?

		internal init (with node:Node) {
			self.current = node
		}
	}
}

extension Node.Ancestors : IteratorProtocol, Sequence {

	internal func next() -> Node? {
		defer { current = current?.parent }
		return current?.parent
	}
}
