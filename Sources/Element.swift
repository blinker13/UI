
public protocol Element {
	var alias:Alias { get }
}

// MARK: -

public extension Element {
	var alias:Alias { return Alias(self) }
}
