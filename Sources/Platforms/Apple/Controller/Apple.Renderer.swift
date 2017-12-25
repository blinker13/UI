
import QuartzCore
import Geometry

internal extension Apple {
	internal final class Renderer : NSObject, CALayerDelegate {

		private var layers:[Node:CALayer]
		private var nodes:[CALayer:Node]

		internal let layer:CALayer
		internal let scene:Scene

		private init (scene:Scene, layer:CALayer) {
			defer { layer.delegate = self }
			self.layers = [scene:layer]
			self.nodes = [layer:scene]
			self.layer = layer
			self.scene = scene
			super.init()
		}
	}
}

// MARK: -

internal extension Apple.Renderer {

	convenience init (with scene:Scene) {
		self.init(scene:scene, layer:CALayer())
	}

	func render(_ change:Change) {
		switch change.kind {
			case .insert(let index): insert(change.node, at:index)
			case .move(let index): move(change.node, to:index)
			case .update: update(change.node)
			case .remove: remove(change.node)
		}
	}

	func action(for layer:CALayer, forKey event:String) -> CAAction? {
//		guard let node = nodes[layer] else { fatalError() }
//		print(node, "->", event)
		return NSNull()
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
}

// MARK: -

private extension Apple.Renderer {

	func insert(_ node:Node, at index:Int) {
		guard let key = node.parent else { fatalError() }
		guard let parent = layers[key] else { fatalError() }

		let layer = CALayer(delegate:self)
		parent.insert(layer, at:index)

		layers[node] = layer
		nodes[layer] = node
	}

	func update(_ node:Node) {
		guard let layer = layers[node] else { fatalError() }

		layer.masksToBounds = node.overflow.isHidden

		layer.backgroundColor = node.background?.cgColor
		layer.cornerRadius = CGFloat(node.border?.radius ?? 0)
		layer.borderWidth = CGFloat(node.border?.width ?? 0)
		layer.borderColor = node.border?.color.cgColor

		layer.shadowColor = node.shadow?.color.cgColor
		layer.shadowOffset = CGSize(width:CGFloat(node.shadow?.offset.x ?? 0), height:CGFloat(-(node.shadow?.offset.y ?? 0)))
		layer.shadowRadius = CGFloat(node.shadow?.radius ?? 3)
		layer.shadowOpacity = Float(node.shadow?.opacity ?? 0)

//		if node.element is Drawable {
//			layer.setNeedsDisplay()
//		}
	}

	func move(_ node:Node, to index:Int) {
		guard let key = node.parent else { fatalError() }
		guard let child = layers[node] else { fatalError() }
		guard let parent = layers[key] else { fatalError() }
		parent.insert(child, at:index)
	}

	func remove(_ node:Node) {
		let layer = layers.removeValue(forKey:node)!
		_ = nodes.removeValue(forKey:layer)
		layer.removeFromSuperlayer()
	}
}
