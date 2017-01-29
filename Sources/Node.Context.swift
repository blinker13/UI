
internal extension Node {

	internal final class Context {

		fileprivate weak var node:Node!
		fileprivate weak var scene:Scene!

		internal init (with node:Node, inside scene:Scene) {
			self.scene = scene
			self.node = node
		}
	}
}

extension Node.Context : Context {

	var frame:Rect { return node.frame }

	func update() {
		scene.update(node)
	}
}
