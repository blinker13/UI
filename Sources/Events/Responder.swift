
public protocol Responder {
	var next:Responder? { get }
}

// MARK: -

internal extension Responder {

	var chain:Chain<Responder> {
		return Chain(self) { $0.next }
	}
}
