
internal final class Node {

	internal weak var parent:Node?
	internal var component:Component
	internal var children:[Node] = []
	internal var bounds:Rect = .zero
	internal var frame:Rect = .zero
	internal var scope:Scope

	internal init (with component:Component) {
		self.scope = component.scope
		self.component = component
	}
}

internal extension Node {
	var ancestors:Ancestors { return Ancestors(with:self) }
	var isRoot:Bool { return parent == nil }
}

extension Node : Hashable {

	internal static func == (left:Node, right:Node) -> Bool {
		return left.hashValue == right.hashValue
	}

	internal var hashValue:Int {
		let identifier = ObjectIdentifier(self)
		return identifier.hashValue
	}
}

private extension Node {
	var visual:Visual? { return component as? Visual }
	var isVisible:Bool { return visual?.isVisible ?? false }
}
