
public struct Gesture : Event {
	public let touches:Set<Touch>
	public let timestamp:Timestamp
}

// MARK: -

internal extension Gesture {

	subscript (phase:Touch.Phase) -> Set<Touch>? {
		let filtered = touches.filter { $0.phase == phase }
		return filtered.count > 0 ? filtered : nil
	}

//	subscript (digit:Touch.Digit) -> Touch? {
//		return touches.first { $0.digit == digit }
//	}
}

extension Gesture : CustomStringConvertible {

	public var description: String {
		//TODO: Make this multiline with scoped pointers description
		return "Gesture(from \(timestamp) with \(touches))"
	}
}
