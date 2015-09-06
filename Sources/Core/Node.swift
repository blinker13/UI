
public class Node : Hashable {

	private weak var parent:Node?
	private var children:[Node] = []
	private var element:Element

	internal init (with element:Element) {
		self.element = element
	}

	public func mount() -> Node {
		return self
	}

	public func unmount() {

	}
}

// MARK: -

public extension Node {

	static func == (left:Node, right:Node) -> Bool {
		return left.hashValue == right.hashValue
	}

	var hashValue:Int {
		let idendifier = ObjectIdentifier(self)
		return idendifier.hashValue
	}
}

// MARK: -

internal extension Node {

	var ancestors:Chain<Node> {
		return Chain(parent) { $0.parent }
	}
}
