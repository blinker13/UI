
import Dispatch
import Geometry

internal final class Scene {

	fileprivate let root:Node
	fileprivate var nodes:Set<Node>

	internal init (with node:Node) {
		self.nodes = [node]
		self.root = node
	}
}

internal extension Scene {

	var minimumSize:Size { return root.component.minimumSize }
	var maximumSize:Size { return root.component.maximumSize }

	internal convenience init (with component:Component) {
		let node = Node(component)
		self.init(with: node)
	}

	func update(with size:Size) {
		if size == root.frame.size { return }
		root.frame.size = size
		setNeedsDisplay(root)
	}

	func display(with renderer:Renderer) {
		let nodes = AnyIterator(nextNode)

	}
}

private extension Scene {

	func setNeedsDisplay(_ node:Node) {
		nodes.insert(node)
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
//				renderer.insert(newChild, at:index)
				node.children.append(newChild)
				nodes.insert(newChild)

			} else {
				let child = node.children[index]

				if type(of:component) == type(of:child.component) {
					child.component = component
					child.frame = rectangle
//					renderer.update(child)
					nodes.insert(child)

				} else {
					let newChild = Node(component, parent:node, frame:rectangle)
					node.children[index] = newChild
//					renderer.remove(child)
//					renderer.insert(newChild, at:index)
					nodes.insert(newChild)
				}
			}
		}
	}

	func nextNode() -> Node? {
		guard let node = nodes.first else { return nil }
		let parentIterator = ParentNodeIterator(node)
		let next = parentIterator.filter(nodes.contains).last ?? node
		return nodes.remove(next)
	}
}
