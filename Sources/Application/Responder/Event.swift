
public typealias Timestamp = Double

public protocol Event {
	var timestamp:Timestamp { get }
}
