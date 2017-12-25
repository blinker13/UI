
public struct Gesture : Event, CustomStringConvertible {

	public let timestamp:Timestamp
	public let touches:Set<Touch>

	internal init (timestamp:Timestamp, touches:Set<Touch>) {
		self.timestamp = timestamp
		self.touches = touches
	}
}

// MARK: -

public extension Gesture {

	var description:String {
		// TODO: Make this multiline with scoped pointers description
		return "Gesture(from \(timestamp) with \(touches))"
	}

	func send(to responder:Responder) -> Bool {
		print("->", responder)
//		guard let target = responder as? Touchable else { return false }
//		send(.began, to:target)
//		send(.moved, to:target)
//		send(.ended, to:target)
//		send(.cancelled, to:target)
		return true
	}
}

// MARK: -

internal extension Gesture {

	var scenes:Set<Scene> {
		let activeTouches = touches.lazy.filter { $0.phase != .stationary }
		return Set(activeTouches.flatMap { $0.scene })
	}

	func nodes(for scene:Scene) -> Set<Node> {
		let activeTouches = touches.lazy.filter { $0.phase != .stationary }
		let nodes = activeTouches.lazy.flatMap { $0.node }
		return Set(nodes.filter { $0.scene == scene })
	}

	func touches(for node:Node, with phase:Touch.Phase) -> Set<Touch> {
		return Set(touches.filter { $0.phase == phase && $0.node == node })
	}

	func send(_ phase:Touch.Phase, to t:Touchable) {

	}
}
