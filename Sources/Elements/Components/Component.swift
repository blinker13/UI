
import Geometry

public typealias Entity = Hashable & Scopable
public typealias Stateless = Component<Void>

internal protocol Stateful {
	typealias Delegate = (Event) -> Void
	func update(with delegate:@escaping Delegate) -> [Element]
	func reconcile(with element:Element)
	func initialize()
}

// MARK: -

open class Component<State> : Stateful, Element {

//	private var environment:Gesture.Environment!
	private var delegate:Delegate!
	private var state:State

	internal var model:Element! {
		willSet { prepare(newValue) }
	}

	public init (initial state:State) {
		self.state = state
	}

	open func render() -> Element {
		return model
	}
}

// MARK: -

public extension Component {

	var content:[Element] { return model.content }
	var style:Style { return model.style }
	var current:State { return state } // TODO: ensure thread safity

	func update() {
		// TODO: implement
	}
}

// MARK: -

internal extension Component {

	func update(with delegate:@escaping Delegate) -> [Element] {
		self.delegate = delegate
		self.model = render()

		// TODO: replace recursion with loop in Node

		switch model {
			case let forward as Stateful: return forward.update(with:delegate)
			default: return model.content
		}
	}

	func reconcile(with element:Element) {
		guard let this = element as? Component<State> else { return }
//		self.environment = this.environment
		self.state = this.state
	}

	func initialize() {
//		environment = Gesture.Environment(
//
//		)
	}
}

// MARK: -

private extension Component {

	

	func prepare(_ next:Element) {
		guard let new = next as? Stateful else { return }
		if let old = model { new.reconcile(with:old) }
		else { new.initialize() }
	}
}
