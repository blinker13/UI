
public typealias Children = [Element]

extension Array : UI.Element where Element : UI.Element {
	public var scope:Scope { return .none }
}
