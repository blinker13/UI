
public protocol Panable : Responder {
	func onBegan(_ pan:Pan)
	func onMoved(_ pan:Pan)
	func onEnded(_ pan:Pan)
}

// MARK: -

public struct Pan : Event {

	public enum Phase {
		case began
		case moved
		case ended
	}

	public let phase:Phase
	public let timestamp:Timestamp
}
