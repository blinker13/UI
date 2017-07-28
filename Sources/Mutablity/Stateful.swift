
public protocol Stateful : Component {
	associatedtype Element
	
	var initialState:State<Element> { get }
	func render(with state:State<Element>) -> [Component]
}

public extension Stateful {

	var scope:Scope {
		let state = initialState

		return Scope() { handler in
			state.handler = handler
			return self.render(with:state)
		}
	}
}

public extension Stateful where Element : Autonomous {

	var initialState:State<Element> {
		let element = Element.init()
		return State(with:element)
	}
}
