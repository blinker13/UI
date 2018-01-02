
import Geometry

internal protocol Stateful {
	weak var node:Node? { get set }
	func reconcile(with element:Element)
}

// MARK: -

open class Component<State> : Stateful, Element {

	private var state:State

	internal weak var node:Node?

	public init (initial state:State) {
		self.state = state
	}

	open func render() -> View {
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
		send { block(&self.state); return $0.update }
	}

	func update(using block:@escaping (State) -> State) {
		send { self.state = block(self.state); return $0.update }
	}

	func set(_ state:State) {
		update { _ in return state }
	}
}

// MARK: -

internal extension Component {

	func reconcile(with element:Element) {
		guard let previous = element as? Component<State> else { return }
		self.state = previous.state
	}
}

// MARK: -

private extension Component {

	func send(update:@escaping (Scene) -> (Node) -> Void) {
		Application.shared.send(update, from:node!)
	}
}
