
public protocol Component : Element {
	func render() -> Element
}

// MARK: -

extension Array : Component where Element == UI.Element {
	public func render() -> Element { return self }
}
