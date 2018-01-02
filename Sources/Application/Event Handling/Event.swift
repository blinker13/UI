
public typealias Timestamp = Double

public protocol Event {
	var timestamp:Timestamp { get }
}

// MARK: -

internal extension Set where Element == Scene {

	func send(_ event:Event) {
		forEach { $0.send(event) }
	}
}
