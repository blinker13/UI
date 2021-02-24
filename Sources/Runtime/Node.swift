
public final class Node: Hashable {

	private weak var parent: Node?
	private var children: [Node] = []
	private var content: Any

	public init(with content: Any) {
		self.content = content
	}
}

public extension Node {
	static func == (left: Node, right: Node) -> Bool {
		left.hashValue == right.hashValue
	}

	func hash(into hasher: inout Hasher) {
		hasher.combine(id)
	}
}

internal extension Node {
//	func reconcile(using reconciler: Reconciler) {
//
//	}
}

private extension Node {
	var id: ObjectIdentifier { .init(self) }
}

