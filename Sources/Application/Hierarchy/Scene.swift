
import Dispatch
import Geometry

internal final class Scene : Node {

	internal typealias Transaction = AnyIterator<Node>

	private var focus:Node?
	private var nodes:Set<Node> = []

	internal override var next:Responder? {
		return Application.shared
	}

	internal override init (with element:Element) {
		super.init(with:element)
		self.update(self)
	}
}

// MARK: -

internal extension Scene {

//	var minimum:Size { return Size(element.width.min, element.height.min) }
//	var maximum:Size { return Size(element.width.max, element.height.max) }

	func send(_ event:Event) {
		switch event {
			case let gesture as Gesture: send(gesture)
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

	func send(_ gesture:Gesture) {
		for responder in gesture.nodes(for:self) {

			for next in responder.chain {
//				guard let node = next as? Node else { continue }
//				guard let target = node.renderer as? Touchable else { continue }
//				print("try", "->", target)
			}
			print("=======================")
		}
	}
}
