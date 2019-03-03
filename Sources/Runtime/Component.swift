
public protocol Component : Element {
	func render() -> Element
}

// MARK: -

public extension Component {
	var scope:Scope { return .none }
}
