
import QuartzCore
import Geometry

internal extension Apple {
	internal final class Renderer : NSObject, CALayerDelegate {

		private var layers = [Node:CALayer]()
		private var nodes = [CALayer:Node]()

		internal let layer:CALayer
		internal let scene:Scene

		private init (scene:Scene, layer:CALayer) {
			self.scene = scene
			self.layer = layer
			super.init()
			realize()
		}
	}
}

// MARK: -

internal extension Apple.Renderer {

	convenience init (with scene:Scene) {
		self.init(scene:scene, layer:CALayer())
	}

	func render() {
		let transaction = scene.flush()
		transaction.forEach(apply)
	}

	func layoutSublayers(of layer:CALayer) {
		guard let node = nodes[layer] else { fatalError() }

		let frame = Rect(cg:layer.frame)
		let rects = node.layout(in:frame)

		for (index, rect) in rects.enumerated() {
			let child = layer.sublayers![index]
			child.frame = CGRect(with:rect)
		}
	}

	func draw(_ layer:CALayer, in ctx:CGContext) {
//		guard let node = nodes[layer] else { fatalError() }
//		guard let surface = node.element as? Drawable else { return }
//
//		let rect = Rect(cg:layer.bounds)
//		let composition = surface.draw(in:rect)
//
//		ctx.saveGState()
//
////		ctx.setAllowsFontSmoothing(true)
//		ctx.setShouldSmoothFonts(false)
//
//		ctx.setAllowsFontSubpixelPositioning(true)
//		ctx.setShouldSubpixelPositionFonts(true)
//
//		ctx.setAllowsFontSubpixelQuantization(true)
//		ctx.setShouldSubpixelQuantizeFonts(true)
//
//		ctx.textMatrix = .identity
//
//		ctx.draw(surface.pre)
//		ctx.draw(composition)
//		ctx.draw(surface.post)
//
//		ctx.restoreGState()
	}

	func action(for layer:CALayer, forKey event:String) -> CAAction? {
//		guard let node = nodes[layer] else { fatalError() }
//		print(node, "->", event)
		return NSNull()
	}

}

private extension Apple.Renderer {

	func apply(commit:Commit) {
		let layer = layers[commit.node]!
		layer.update(with:commit.node.element)
		commit.changes.forEach(apply)
	}

	func apply(change:Change) {
		switch change.kind {
			case .insert(let index): insert(change.node, at:index)
			case .move(let index): move(change.node, to:index)
			case .remove: remove(change.node)
		}
	}

	func insert(_ node:Node, at index:Int) {
		let layer = CALayer()
		insert(layer, with:node, at:index)
		associate(node, with:layer)
	}

	func move(_ node:Node, to index:Int) {
		insert(layers[node]!, with:node, at:index)
	}

	func remove(_ node:Node) {
		let layer = layers.removeValue(forKey:node)!
		_ = nodes.removeValue(forKey:layer)
		layer.removeFromSuperlayer()
	}

	func associate(_ node:Node, with layer:CALayer) {
		layer.delegate = self
		layers[node] = layer
		nodes[layer] = node
	}

	func insert(_ layer:CALayer, with node:Node, at index:Int) {
		let parent = layers[node.parent!]!
		parent.insertSublayer(layer, at:UInt32(index))
	}

	func realize() {
		associate(scene, with:layer)
	}
}
