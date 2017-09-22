
import QuartzCore
import Geometry
import Graphics

internal final class AppleRenderer : NSObject {

	internal var layers = [Node:CALayer]()
	internal var nodes = [CALayer:Node]()
	internal let root:CALayer

	internal init (root:CALayer) {
		self.root = root
	}
}

//extension AppleRenderer : Renderer {
//
//	func insert(_ node:Node, at index:Int) {
//		let layer = createLayer(for:node)
//		insert(layer, with:node, at:index)
//		layer.update(with:node)
//	}
//
//	func update(_ node:Node) {
//		let layer = fetchLayer(for:node)
//		layer.update(with:node)
//	}
//
//	func remove(_ node:Node) {
//		if let layer = layers.removeValue(forKey:node) {
//			_ = nodes.removeValue(forKey:layer)
//			layer.removeFromSuperlayer()
//		}
//	}
//}

extension AppleRenderer : CALayerDelegate {

	func draw(_ layer:CALayer, in ctx:CGContext) {
		guard let node = nodes[layer] else { return }
		guard let surface = node.element as? Drawable else { return }

		let rect = Rect(cg:layer.bounds)
		let composition = surface.draw(in:rect)

		ctx.saveGState()

//		ctx.setAllowsFontSmoothing(true)
		ctx.setShouldSmoothFonts(false)

		ctx.setAllowsFontSubpixelPositioning(true)
		ctx.setShouldSubpixelPositionFonts(true)

		ctx.setAllowsFontSubpixelQuantization(true)
		ctx.setShouldSubpixelQuantizeFonts(true)

		ctx.textMatrix = .identity

		ctx.draw(surface.pre)
		ctx.draw(composition)
		ctx.draw(surface.post)

		ctx.restoreGState()
	}

	public func action(for layer: CALayer, forKey event: String) -> CAAction? {
		return NSNull()
	}
}

private extension AppleRenderer {

	func createLayer(for node:Node) -> CALayer {
		let layer = node.isRoot ? root : CALayer()
		layer.delegate = self
		return layer
	}

	func fetchLayer(for node:Node) -> CALayer {
		return node.isRoot ? root : layers[node]!
	}

	func insert(_ layer:CALayer, with node:Node, at index:Int) {
		let parent = fetchLayer(for:node.parent!)
		parent.insertSublayer(layer, at:UInt32(index))
		layers[node] = layer
		nodes[layer] = node
	}
}
