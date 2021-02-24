
public final class Node : Hashable {

	private weak var parent: Node?
	private var children: [Node] = []
	private var content: Any

	public init(with content: Any) {
		self.content = content
	}
}

// MARK: -

public extension Node {
	static func == (left: Node, right: Node) -> Bool {
		left.id == right.id
	}

	func hash(into hasher: inout Hasher) {
		hasher.combine(id)
	}
}

// MARK: -

internal extension Node {
//	func reconcile(using reconciler: Reconciler) {
//
//	}
}

// MARK: -

private extension Node {
	var id: ObjectIdentifier { .init(self) }
}
