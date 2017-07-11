
public final class Scene {

	internal let root:Node
	internal var nodes:Set<Node>

	internal init (with node:Node) {
		self.nodes = [node]
		self.root = node
	}
}

extension Scene : Component {

	public var width:Dimensions { return root.component.width }
	public var height:Dimensions { return root.component.height }

	public func render() -> [Component] {
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
