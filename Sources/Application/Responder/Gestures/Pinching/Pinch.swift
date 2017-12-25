
public protocol Pinchable : Responder {
	func onBegan(_ pinch:Pinch)
	func onMoved(_ pinch:Pinch)
	func onEnded(_ pinch:Pinch)
	func onCancelled(_ pinch:Pinch)
}

// MARK: -

public struct Pinch : Event {

	public enum Phase {
		case began
		case moved
		case ended
	}

	public let phase:Phase
	public let timestamp:Timestamp
}
