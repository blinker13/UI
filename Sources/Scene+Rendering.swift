
internal extension Scene {
	func display(with renderer:Renderer) {
		for node in AnyIterator(nextNode) {
			display(node, with:renderer)
		}
	}
}

private extension Scene {

	func nextNode() -> Node? {
		guard let node = nodes.first else { return nil }
		let filteredAncestors = node.ancestors.filter(nodes.contains)
		let next = filteredAncestors.last ?? node
		return nodes.remove(next)
	}

	func display(_ node:Node, with renderer:Renderer) {

		// FIXME: this is just a temporary workaround
		if node.isRoot { renderer.update(node) }

		let children = node.scope.render { update in
			self.mark(node)
			update()
		}

		let container = Flex.Container(with:node)
		let components = children.enumerated()

		var flexIndexes = [Int]()
		var remainder = container.main.constraint

		var layouts = components.map { (arg) -> ComponentLayout in

			let (index, component) = arg
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
