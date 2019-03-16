
public typealias Fragment = [Element]

extension Array : UI.Element where Element == UI.Element {
	public var scope:Scope { return .none }
}

extension Array : Component where Element == UI.Element {
	public func render() -> Element { return self }
}
