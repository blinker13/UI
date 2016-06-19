
import QuartzCore

extension QuartzRenderer : Renderer {

	func insert(_ node:Node, at index:Int) {

		let x = CGFloat(node.frame.origin.x)
		let y = CGFloat(node.frame.origin.y)
		let w = CGFloat(node.frame.size.width)
		let h = CGFloat(node.frame.size.height)

		let layer = createLayer(for:node)
		layer.frame = CGRect(x:x, y:y, width:w, height:h)

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

// MARK: -

private extension QuartzRenderer {

	func insert(_ layer:CALayer, with node:Node, at index:Int) {
		let parentLayer = fetchLayer(for:node.parent!)
		parentLayer.insertSublayer(layer, at:UInt32(index))
	}

	func update(_ layer:CALayer, with node:Node) {
		guard let visual = node.component as? Visual else { return }
		layer.backgroundColor = visual.background?.quartz

		layer.cornerRadius = CGFloat(visual.border?.radius ?? 0)
		layer.borderWidth = CGFloat(visual.border?.width ?? 0)
		layer.borderColor = visual.border?.color.quartz

		layer.shadowColor = visual.shadow?.color.quartz
		layer.shadowOffset = CGSize(width:CGFloat(visual.shadow?.offset.x ?? 0), height:CGFloat(-(visual.shadow?.offset.y ?? 0)))
		layer.shadowRadius = CGFloat(visual.shadow?.radius ?? 3)
		layer.shadowOpacity = Float(visual.shadow?.opacity ?? 0)

		layer.masksToBounds = visual.overflow.isHidden
	}
}
