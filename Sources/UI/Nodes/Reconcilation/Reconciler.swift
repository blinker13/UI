
internal final class Reconciler {

	fileprivate struct Trace : Hashable {
		let scopable:Scopable
		let position:Int
		let origin:Int
	}

	private let node:Node
	private let scene:Scene
	private var traces:Set<Trace>
	private var changes = [Change]()
	private var offest = 0

	internal init (with node:Node) {
		let iterator = node.children.enumerated()
		let results = iterator.map(Trace.init)
		self.traces = Set(results)
		self.scene = node.scene
		self.node = node
	}
}

// MARK: -

internal extension Reconciler {

	var results:[Change] {
		return changes + traces.map {
			let node = $0.scopable as! Node
			return Change(remove:node)
		}
	}

	func update(_ elements:[Element]) -> [Node] {
		let enumerator = elements.enumerated()
		return enumerator.map(update)
	}

	func update(_ style:Style) -> Style {
		// TODO: calculate inherited styling
		let change = Change(update:node)
		changes.append(change)
		offest -= 1
		return style
	}
}

// MARK: -

private extension Reconciler {

	var position:Int {
		return offest + changes.count
	}

	func update(index:Int, with element:Element) -> Node {

		if let trace = match(element, at:index) {
			let match = trace.scopable as! Node
			if trace.origin != index { move(match, to:index) }
			if index == position { offest += 1 }
			match.update(with:element)
			scene.update(match)
			return match

		} else {
			let child = Node(with:element)
			insert(child, at:index)
			scene.update(child)
			return child
		}
	}

	func match(_ element:Element, at index:Int) -> Trace? {
		guard let scopable = element as? Scopable else { return nil }
		let proxy = Trace(offset:index, item:scopable)
		return traces.remove(proxy)
	}

	func insert(_ child:Node, at index:Int) {
		let change = Change(insert:child, at:index)
		changes.append(change)
	}

	func move(_ child:Node, to index:Int) {
		let change = Change(move:child, to:index)
		changes.append(change)
	}
}

// MARK: -

private extension Reconciler.Trace {

	static func == (left:Reconciler.Trace, right:Reconciler.Trace) -> Bool {
		return left.hashValue == right.hashValue
	}

	init (offset:Int, item:Scopable) {
		self.position = offset
		self.origin = offset
		self.scopable = item
	}

	var hashValue:Int {
		return scopable.scope.hashValue
	}
}
