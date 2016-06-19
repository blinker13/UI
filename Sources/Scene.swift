
import Canvas

internal final class Scene {

	private let renderer:Renderer
	private let rootNode:Node

	private var markedNodes = Set<Node>()

	internal init(_ component:Component, _ renderer:Renderer) {
		self.rootNode = Node(component)
		self.renderer = renderer
	}
}

// MARK: -

internal extension Scene {

	func update(_ size:Size) {
		updateRootNode(size)
		updateHierarchy()
	}

	func update() {
		update(rootNode.frame.size)
	}
}

// MARK: -

private extension Scene {

	func updateRootNode(_ size:Size) {
		if rootNode.frame.size == size { return }
		rootNode.frame.size = size
		markedNodes.insert(rootNode)
		renderer.update(rootNode)
	}

	func updateHierarchy() {
		let nodes = AnyIterator(nextNode)
		nodes.forEach(update)
	}

	func update(_ node:Node) {
		guard let calculator = LayoutCalculator(node) else { return }

		for (index, component, rectangle) in calculator {

			if index >= node.children.count {
				let newChild = Node(component, parent:node, frame:rectangle)
				renderer.insert(newChild, at:index)
				node.children.append(newChild)
				markedNodes.insert(newChild)

			} else {
				let child = node.children[index]

				if component.dynamicType == child.component.dynamicType {
					child.component = component
					child.frame = rectangle
					renderer.update(child)
					markedNodes.insert(child)

				} else {
					let newChild = Node(component, parent:node, frame:rectangle)
					node.children[index] = newChild
					renderer.remove(child)
					renderer.insert(newChild, at:index)
					markedNodes.insert(newChild)
				}
			}
		}
	}

	func nextNode() -> Node? {
		guard let node = markedNodes.first else { return nil }
		let parentIterator = ParentNodeIterator(node)
		let next = parentIterator.filter(markedNodes.contains).last ?? node
		return markedNodes.remove(next)
	}
}
