
internal final class Node {

	internal weak var parent:Node?
	internal var component:Component
	internal var children:[Node] = []

	internal var bounds:Rect = .zero
	internal var frame:Rect = .zero

	internal init (with component:Component) {
		self.component = component
	}
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

internal extension Node {

	var ancestors:Ancestors {
		return Ancestors(with:self)
	}

	var isRoot:Bool {
		return parent == nil
	}
}

private extension Node {

	var page:Page? { return component as? Page }
	var visual:Visual? { return component as? Visual }

	var isVisible:Bool { return visual?.isVisible ?? false }
}
