
import Geometry

internal typealias Transaction = AnyIterator<Update>

internal final class Scene : Node {

	private var queue:Set<Node> = []

	internal override init (with element:Element) {
		super.init(with:element)
		self.update(self)
	}
}

// MARK: -

internal extension Scene {

	var minimum:Size { return Size(width.min, height.min) }
	var maximum:Size { return Size(width.max, height.max) }

	func send(_ event:Event) {
		switch event {
			case let gesture as Gesture: send(gesture)
			default: fatalError("unsupported event: \(event)")
		}
	}

	func update(_ node:Node) {
		// TODO: check if node is descendant of scene
		queue.insert(node)
	}

	func flush() -> Transaction {
		return Transaction(update)
	}
}

// MARK: -

private extension Scene {

	func next() -> Node? {
		guard let node = queue.first else { return nil }
		let filteredNodes = node.ancestors.filter(queue.contains)
		let next = filteredNodes.last ?? node
		return queue.remove(next)
	}

	func update() -> Update? {
		guard let node = next() else { return nil }
		let elements = node.update { print($0) } //TODO: implementation
		var changes = ChangeSet(with:node)
		var children = [Node]()

		for (index, element) in elements.enumerated() {

			if let match = changes.match(element) {
				children.append(match.node)
				match.node.model = element
				update(match.node)//TODO: soft update

				if match.origin == index || changes.skip(index) { continue }
				changes.move(match.node, to:index)

			} else {//TODO: check current child for type conformance
				let new = Node(with:element)
				changes.insert(new, at:index)
				children.append(new)
				update(new)
			}
		}

		changes.deletions.forEach(remove)
		node.children = children

		return Update(changes:changes, node:node)
	}

	func remove(change:Change) {
		precondition(change.kind == .remove)
		queue.remove(change.node)
	}

	func send(_ gesture:Gesture) {
		print("->", gesture.touches)
		let nodes = gesture.touches.map { $0.node }

//		for node in Set(nodes) {
//			if let touches = gesture[.began] { node.onBegan(touches, with:gesture) }
//			if let touches = gesture[.moved] { node.onMoved(touches, with:gesture) }
//			if let touches = gesture[.ended] { node.onEnded(touches, with:gesture) }
//			if let touches = gesture[.cancelled] { node.onCancelled(touches, with:gesture) }
//		}
	}
}

//	private var responders = [Touch.Digit:Node]()
//
//	func test(_ digit:Touch.Digit) -> Node? {
//		return responders[digit] ?? root.test(digit.location)
//	}
//
//	func onEvent(_ event:Event) {
//		for node in responding(to:event) {
//			print(node)
//		}
//	}
//
//	func responding(to event:Event) -> [Node] {
//
//		switch event {
//			case let gesture as Gesture: return gesture.touches.map(check)
//			default: fatalError("unsupported event: \(event)")
//		}
//	}
//
//	func check(_ touch:Touch) -> Node {
//
//		switch touch.phase {
//			case .began: responders[touch.digit] = touch.node
//			case .ended, .cancelled: responders[touch.digit] = nil
//			default: break
//		}
//
//		return touch.node
//	}
//
