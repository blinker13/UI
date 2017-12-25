
import Geometry

internal protocol Stateful : Responder {
	weak var delegate:Node? { get set }
	func update(with renderer:Renderer)
}

// MARK: -

open class Component<State> : Stateful, Renderer {

	internal weak var delegate:Node?
	internal var state:State

	public init (initial state:State) {
		self.state = state
	}

	open func render() -> Element {
		fatalError()
	}
}

// MARK: -

public extension Component {

	var current:State {
		// TODO: ensure thread safity
		return state
	}

	func modify(using block:@escaping (inout State) -> Void) {
		sendUpdate { block(&self.state) }
	}

	func update(using block:@escaping (State) -> State) {
		sendUpdate { self.state = block(self.state) }
	}

	func set(_ state:State) {
		update { _ in return state }
	}
}

// MARK: -

internal extension Component {

	func update(with renderer:Renderer) {
		guard let previous = renderer as? Component<State> else { return }
		// TODO: update gesture recognizer
		self.state = previous.state
	}
}

// MARK: -

private extension Component {

	func sendUpdate(_ handler:@escaping () -> Void) {
		let action = Action(send:Scene.update, from:delegate!)
		Application.shared.send(action) { success in
			if success { handler() }
		}
	}
}
