
public class Node : Element {

	internal typealias Children = [Node]

	private weak var parent:Node?
	private var children:Children
	private var model:Element

	internal init (with element:Element) {
		self.children = Children()
		self.model = element
	}
}

// MARK: -

public extension Node {
	var alias:Alias { return model.alias }
	var scope:Scope { return model.scope }
}
