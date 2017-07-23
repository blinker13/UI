
public final class Scene {

	internal let root:Node
	internal var nodes:Set<Node>

	internal init (with node:Node) {
		self.nodes = [node]
		self.root = node
	}
}

public extension Scene {

	var width:Dimensions { return root.component.width }
	var height:Dimensions { return root.component.height }

	var minimumSize:Size { return Size(width.min, height.min) }
	var maximumSize:Size { return Size(width.max, height.max) }

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
