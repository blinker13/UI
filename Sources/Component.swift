
public protocol Component : Element {
	associatedtype Value

	func render(with state:State<Value>) -> [Element]
}

public extension Component {

	var children:[Element] {
		return render(with:state)
	}

	var state:State<Value> {
		return State(with:scope)
	}
}
