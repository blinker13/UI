
public final class Scene {

	internal let root:Node
	internal var nodes:Set<Node>

	internal init (with node:Node) {
		self.nodes = [node]
		self.root = node
	}
}

extension Scene : Page {

	public var width:Dimensions { return root.component.width }
	public var height:Dimensions { return root.component.height }

	public func onStart() { page?.onStart() }
	public func onResume() { page?.onResume() }
	public func onPause() { page?.onPause() }
	public func onStop() { page?.onStop() }

	public func render(with context: Context) -> [Component] {
		return [root.component]
	}
}

public extension Scene {
	convenience init (with component:Component) {
		let node = Node(with:component)
		self.init(with:node)
	}
}

internal extension Scene {

	func update(_ size:Size) {
		if size == root.frame.size { return }
		root.frame.size = size
		mark(root)
	}

	func mark(_ node:Node) {
		let parent = node.parent ?? node
		nodes.insert(parent)
	}
}

private extension Scene {

	var page:Page? {
		return root.component as? Page
	}
}
