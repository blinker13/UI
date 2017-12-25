
public protocol Scrollable : Responder {
	func onBegan(_ scroll:Scroll)
	func onMoved(_ scroll:Scroll)
	func onEnded(_ scroll:Scroll)
	func onCancelled(_ scroll:Scroll)
}

// MARK: -

public struct Scroll : Event {

	public enum Phase {
		case began
		case moved
		case ended
	}

	public let phase:Phase
	public let timestamp:Timestamp
}
