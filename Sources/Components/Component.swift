
import Geometry
import Styling

internal protocol Stateful {
	typealias Delegate = (Event) -> Void
	func update(with delegate:@escaping Delegate) -> [Element]
	func reconcile(with element:Element)
}

public typealias Entity = Hashable & Scopable
public typealias Stateless = Component<Void>

open class Component<State> : Stateful, Element {

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

	var content:[Element] {
		return model.content
	}

	var style:Style {
		return model.style
	}

	var current:State {
		// TODO: ensure thread safity
		return state
	}

	// TODO: implement
	func update() {}
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
		self.state = this.state
	}
}

// MARK: -

private extension Component {

	func prepare(_ next:Element) {
		guard let old = model else { return }
		guard let new = next as? Stateful else { return }
		new.reconcile(with:old)
	}
}
