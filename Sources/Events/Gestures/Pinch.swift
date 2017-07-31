
public struct Pinch : Event {

	public enum Phase {
		case began
		case moved
		case ended
	}

	public let phase:Phase
	public let timestamp:Timestamp
}
