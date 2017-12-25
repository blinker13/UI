
import Dispatch
import Geometry

internal final class Scene : Node {

	private var nodes:Set<Node> = []

	internal override init (with renderer:Renderer) {
		super.init(with:renderer)
		self.update(self)
	}
}

// MARK: -

internal extension Scene {

	var minimum:Size { return Size(element.width.min, element.height.min) }
	var maximum:Size { return Size(element.width.max, element.height.max) }

	func send(_ event:Event) {
		switch event {
			case let gesture as Gesture: send(gesture)
			default: fatalError("unsupported event: \(event)")
		}
	}

	func update(_ node:Node) {
		// TODO: check if node is descendant of scene
		nodes.insert(node)
	}

	func flush() -> Transaction {
		defer { nodes.removeAll() }
		return Transaction(with:nodes)
	}
}

// MARK: -

private extension Scene {

	var delegate:(Event) -> Void {
		return { [weak self] event in
			self?.send(event)
		}
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
