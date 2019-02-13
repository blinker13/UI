
import Runtime

public protocol Responder {
	var next:Responder? { get }
}

// MARK: -

internal extension Responder {

	var chain:Chain<Responder> {
		return Chain(self) { $0.next }
	}

	func send<Target, Sender>(_ action:(Target) -> (Sender) -> Void, from sender:Sender) {
		let first = chain.first { $0 is Target } as! Target
		let perform = action(first)
		perform(sender)
	}

//	var scene:Scene {
//		let first = chain.first { $0 is Scene }
//		return first as! Scene
//	}
//
//	func responds<Target, Sender>(to action:(Target) -> (Sender) -> Void) -> Bool {
//		let first = self.chain.first { $0 is Target }
//		return first is Target
//	}
//
//	func perform<Target, Sender>(_ action:(Target) -> (Sender) -> Void, with sender:Sender) {
//		let first = self.chain.first { $0 is Target }
//		action(first as! Target)(sender)
//	}
}
