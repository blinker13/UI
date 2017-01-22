
public final class Scene {

	fileprivate let root:Node
	fileprivate var nodes:Set<Node>

	internal init (with node:Node) {
		self.nodes = [node]
		self.root = node
	}
}

extension Scene : Page {

	public var width:Dimensions { return root.width }
	public var height:Dimensions { return root.height }

//	public func compose(with context: Context) -> Component {
	public func compose() -> Component {
		return root
	}

	public func onStart() { page?.onStart() }
	public func onResume() { page?.onResume() }
	public func onPause() { page?.onPause() }
	public func onStop() { page?.onStop() }
}

public extension Scene {

	convenience init (with component:Component) {
		let node = Node(with:component)
		self.init(with: node)
	}
}

internal extension Scene {

	func update(_ size:Size) {
		if size == root.frame.size { return }
		root.frame.size = size
		setNeedsDisplay(root)
	}

	func display(with renderer:Renderer) {
		let nodes = AnyIterator(nextNode)

		for node in nodes {
			display(node, with:renderer)
		}
	}
}

private extension Scene {

	var page:Page? {
		return root.component as? Page
	}

	func setNeedsDisplay(_ node:Node) {
		nodes.insert(node)
	}

	func display(_ node:Node, with renderer:Renderer) {
		guard let calculator = LayoutCalculator(node) else { return }

		for (index, component, rectangle) in calculator {

			print(index, "-->", rectangle)

			if index >= node.children.count {
				let newChild = Node(with:component)
				newChild.frame = rectangle
				newChild.parent = node
				renderer.insert(newChild, at:index)
				node.children.append(newChild)
				nodes.insert(newChild)

			} else {
				let child = node.children[index]

				if type(of:component) == type(of:child.component) {
					child.component = component
					child.frame = rectangle
					renderer.update(child)
					nodes.insert(child)

				} else {
					let newChild = Node(with:component)
					newChild.frame = rectangle
					newChild.parent = node
					node.children[index] = newChild
					renderer.remove(child)
					renderer.insert(newChild, at:index)
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
