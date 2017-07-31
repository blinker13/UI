
internal final class Scene {

	internal let root:Node
	internal var nodes:Set<Node>
	internal var responders = [Touch.Digit:Node]()

	internal init (with node:Node) {
		self.nodes = [node]
		self.root = node
	}
}

internal extension Scene {

	var width:Dimensions { return root.element.width }
	var height:Dimensions { return root.element.height }

	var minimumSize:Size { return Size(width.min, height.min) }
	var maximumSize:Size { return Size(width.max, height.max) }

	convenience init (with element:Element) {
		let node = Node(with:element)
		self.init(with:node)
	}

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

extension Scene : Recognizer {

	func onEvent(_ event:Event) {
		for node in responding(to:event) {
			print(node)
		}
	}

	private func responding(to event:Event) -> [Node] {

		switch event {
			case let gesture as Gesture: return gesture.touches.map(check)
			default: fatalError("unsupported event: \(event)")
		}
	}

	private func check(_ touch:Touch) -> Node {

		switch touch.phase {
			case .began: responders[touch.digit] = touch.node
			case .ended, .cancelled: responders[touch.digit] = nil
			default: break
		}

		return touch.node
	}
}
