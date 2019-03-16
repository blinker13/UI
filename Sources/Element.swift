
public protocol Element {
	var alias:Alias { get }
	var scope:Scope { get }
}

// MARK: -

public extension Element {
	var alias:Alias { return Alias(self) }
}
