
internal protocol Renderer {
	func insert(node:Node, at index:Int)
	func update(node:Node)
	func remove(node:Node)
}

// MARK: -

extension Renderer {
	internal final func insert(node:Node) {
		insert(node, at:0)
	}
}
