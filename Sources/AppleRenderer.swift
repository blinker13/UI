
import QuartzCore

internal final class AppleRenderer {

	internal var content = [Node:CALayer]()
	internal let rootLayer:CALayer

	internal init (root:CALayer) {
		self.rootLayer = root
	}
}

extension AppleRenderer : Renderer {

	func insert(_ node:Node, at index:Int) {
		let layer = createLayer(for:node)
		insert(layer, with:node, at:index)
		update(layer, with:node)
		content[node] = layer
	}

	func update(_ node:Node) {
		let layer = fetchLayer(for:node)
		update(layer, with:node)
	}

	func remove(_ node:Node) {
		let layer = content.removeValue(forKey: node)
		layer?.removeFromSuperlayer()
	}
}

private extension AppleRenderer {

	func createLayer(for node:Node) -> CALayer {
		return node.parent == nil ? rootLayer : CALayer()
	}

	func fetchLayer(for node:Node) -> CALayer {
		return node.parent == nil ? rootLayer : content[node]!
	}

	func insert(_ layer:CALayer, with node:Node, at index:Int) {
		let parentLayer = fetchLayer(for:node.parent!)
		parentLayer.insertSublayer(layer, at:UInt32(index))
	}

	func update(_ layer:CALayer, with node:Node) {

		layer.masksToBounds = node.component.overflow.isHidden
		layer.frame = CGRect(with:node.frame)

		if let visual = node.component as? Visual {
			layer.backgroundColor = visual.background?.quartz

			layer.cornerRadius = CGFloat(visual.border?.radius ?? 0)
			layer.borderWidth = CGFloat(visual.border?.width ?? 0)
			layer.borderColor = visual.border?.color.quartz

			layer.shadowColor = visual.shadow?.color.quartz
			layer.shadowOffset = CGSize(width:CGFloat(visual.shadow?.offset.x ?? 0), height:CGFloat(-(visual.shadow?.offset.y ?? 0)))
			layer.shadowRadius = CGFloat(visual.shadow?.radius ?? 3)
			layer.shadowOpacity = Float(visual.shadow?.opacity ?? 0)
		}
	}
}
