
import Canvas

internal final class Node : Hashable {

	internal var component:Component

	internal weak var parent:Node?
	internal var children:[Node]
	internal var frame:Rectangle

	internal lazy var hashValue:Int = {
		let identifier = ObjectIdentifier(self)
		return identifier.hashValue
	}()

	internal init(_ component:Component, parent:Node? = nil, frame:Rectangle = .zero) {
		self.component = component
		self.children = []
		self.frame = frame
		self.parent = parent
	}
}

internal func == (left:Node, right:Node) -> Bool {
	return left.hashValue == right.hashValue
}
