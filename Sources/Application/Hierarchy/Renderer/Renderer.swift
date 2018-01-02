
import QuartzCore
import Geometry
import Layout

internal final class Renderer : NSObject, CALayerDelegate {

	func action(for layer:CALayer, forKey event:String) -> CAAction? {
//		guard let node = nodes[layer] else { fatalError() }
//		print(node, "->", event)
		return NSNull()
	}

	func layoutSublayers(of layer:CALayer) {

		let frame = Rect(cg:layer.frame)
		let bounds = Rect(size:frame.size)
		let calculator = Calculator(container:layer.node, in:bounds)
		let rects = calculator.layout(layer.node.children)

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
