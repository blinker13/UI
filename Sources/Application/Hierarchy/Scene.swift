
import Geometry

public final class Scene : Node {

	internal typealias Transaction = AnyIterator<Node>

	private var focus:Node?
	private var nodes:Set<Node> = []

	public override var next:Responder? {
		return Application.shared
	}

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
			case let gesture as Gesture: process(gesture)
			default: fatalError("FIXME: add support for \(event)")
		}
	}

	func update(_ node:Node) {
		nodes.insert(node)
	}

	func flush() -> Transaction {
		return Transaction(dequeue)
	}
}

// MARK: -

private extension Scene {

	func dequeue() -> Node? {
		guard let node = nodes.first else { return nil }
		let filteredNodes = node.ancestors.filter(nodes.contains)
		let next = filteredNodes.last ?? node
		return nodes.remove(next)
	}

	func process(_ gesture:Gesture) {

		for responder in gesture.nodes(for:self) {

			for next in responder.chain {
				guard let node = next as? Node else { continue }
				guard let target = node.element as? Touchable else { continue }

				if let touches = gesture.touches(for:node, with:.began) { target.onBegan(touches, with:gesture) }
				if let touches = gesture.touches(for:node, with:.moved) { target.onMoved(touches, with:gesture) }
				if let touches = gesture.touches(for:node, with:.ended) { target.onEnded(touches, with:gesture) }
				if let touches = gesture.touches(for:node, with:.cancelled) { target.onCancelled(touches, with:gesture) }

				break // ???: forwarding
			}
		}
	}
}
