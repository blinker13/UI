
public struct Gesture : Event {
	public var touches:Set<Touch>
	public var timestamp:Timestamp
}

internal extension Gesture {

	subscript (node:Node) -> Gesture {
		let subset = touches.filter { $0.node == node }
		return Gesture(touches:subset, timestamp:timestamp)
	}

	subscript (phase:Touch.Phase) -> Set<Touch>? {
		let filtered = touches.filter { $0.phase == phase }
		return filtered.count > 0 ? filtered : nil
	}

	subscript (digit:Touch.Digit) -> Touch? {
		return touches.first { $0.digit == digit }
	}
}

extension Gesture : CustomStringConvertible {

	public var description: String {
		//TODO: Make this multiline with scoped pointers description
		return "Gesture(from \(timestamp) with \(touches))"
	}
}
