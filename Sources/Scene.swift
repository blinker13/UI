
internal final class Scene {

	private let component:Component
	private let renderer:Renderer

	private var markedNodes = Set<Node>()

	private lazy var rootNode:Node = {
		let node = Node(self.component)
		self.renderer.insert(node)
		return node
	}()

	// MARK: -

	internal init(_ component:Component, _ renderer:Renderer) {
		self.component = component
		self.renderer = renderer
	}
}

// MARK: -

extension Scene {

	internal func update(size:Size) {
		updateRootNode(size)
		updateHierarchy()
	}

	internal func update() {
		update(rootNode.frame.size)
	}

	// TODO: calculate size that fits

	// MARK: -

	private func updateRootNode(size:Size) {
		guard rootNode.frame.size != size else { return }
		rootNode.frame.size = size
		markedNodes.insert(rootNode)
		renderer.update(rootNode)
	}

	private func updateHierarchy() {
		let nodes = AnyGenerator(body:nextNode)
		nodes.forEach(update)
	}

	private func update(node:Node) {
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

	private func nextNode() -> Node? {
		guard let node = markedNodes.first else { return nil }
		let parentIterator = ParentNodeIterator(node)
		let next = parentIterator.filter(markedNodes.contains).last ?? node
		return markedNodes.remove(next)
	}
}
