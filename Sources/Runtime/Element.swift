
public protocol Element : Encodable {
	var scope:Scope { get }
}

// MARK: -

public extension Element {
	var scope:Scope { return .none }
}

// MARK: -

internal func === (left:Element, right:Element) -> Bool {
	return type(of:left) == type(of:right)
}
