
public final class Scene {

	fileprivate let root:Node
	fileprivate var nodes:Set<Node>

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
		update(root)
	}

	func update(_ node:Node) {
		let parent = node.parent ?? node
		nodes.insert(parent)
	}

	func display(with renderer:Renderer) {
		for node in AnyIterator(nextNode) {
			display(node, with:renderer)
		}
	}
}

private extension Scene {

	var page:Page? {
		return root.component as? Page
	}

	func nextNode() -> Node? {
		guard let node = nodes.first else { return nil }
		let filteredAncestors = node.ancestors.filter(nodes.contains)
		let next = filteredAncestors.last ?? node
		return nodes.remove(next)
	}

	func display(_ node:Node, with renderer:Renderer) {

		let context = Node.Context(with:node, inside:self)
		let children = node.component.render(with:context)
		let container = Flex.Container(with:node)
		let components = children.enumerated()

		var flexIndexes = [Int]()
		var remainder = container.main.constraint

		var layouts = components.map { index, component -> ComponentLayout in
			var layout = ComponentLayout(component, container.main.arrangement)
			layout.cross.calculateLength(with:container.cross.constraint)
			if layout.main.isFlexible { flexIndexes.append(index) }
			remainder -= layout.main.total
			return layout
		}

		if !flexIndexes.isEmpty && remainder > 0 {
			let isReversed = container.justify == .trailing
			let sequence = FlexibleLayoutEnumerator(flexIndexes, layouts, reversed:isReversed)
			remainder = container.distribution.calculation(sequence, remainder) { index, flex in
				layouts[index].main.length += flex
			}
		}


		var offset:Float = 0.0

		for (index, item) in layouts.enumerated() {
			offset += item.main.edges.leading

			let crossRemainder = container.cross.constraint - item.cross.edges.total - item.cross.length
			let crossPosition = container.cross.edges.leading + item.cross.calculatePosition(with:crossRemainder)
			let position = Point(values:[container.main.arrangement:offset, container.cross.arrangement:crossPosition])
			let frame = Rect(origin:position, size:item.size)

			offset += item.main.length + item.main.edges.trailing


			if index >= node.children.count {
				let newChild = Node(with:item.component)
				newChild.frame = frame
				newChild.parent = node
				renderer.insert(newChild, at:index)
				node.children.append(newChild)
				nodes.insert(newChild)

			} else {
				let child = node.children[index]

				if type(of:item.component) == type(of:child.component) {
					child.component = item.component
					child.frame = frame
					renderer.update(child)
					nodes.insert(child)

				} else {
					let newChild = Node(with:item.component)
					newChild.frame = frame
					newChild.parent = node
					renderer.remove(child)
					renderer.insert(newChild, at:index)
					node.children[index] = newChild
					nodes.insert(newChild)
				}
			}
		}
	}
}
