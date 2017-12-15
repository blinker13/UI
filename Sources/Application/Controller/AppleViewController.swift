
#if os(iOS)
import UIKit
public typealias ViewController = UIViewController
#elseif os(OSX)
import AppKit
public typealias ViewController = NSViewController
#endif

import QuartzCore
import Geometry
import Graphics

public final class AppleViewController : ViewController, CALayerDelegate {

	private var layers = [Node:CALayer]()
	private var nodes = [CALayer:Node]()

	internal let scene:Scene

	internal init (with scene:Scene) {
		self.scene = scene
		super.init(nibName:nil, bundle:nil)
	}

	public required init? (coder:NSCoder) {
		fatalError()
	}
}

public extension AppleViewController {

	convenience init (with element:Element) {
		let scene = Scene(with:element)
		self.init(with:scene)
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		associate(scene, with:layer)
		update()
	}

	func layoutSublayers(of layer:CALayer) {
		guard let node = nodes[layer] else { fatalError() }
		let frame = Rect(cg:layer.frame)
		node.layout(in:frame)

		print(node, "->", frame)
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
		guard let node = nodes[layer] else { fatalError() }
		print(node, "->", event)
		return NSNull()
	}
}

internal extension AppleViewController {

	func update() {
		print("will update Scene")
		let transaction = scene.flush()
		transaction.forEach(apply)
	}
}

private extension AppleViewController {

	func apply(update:Update) {
		let layer = layers[update.node]!
		layer.update(with:update.node)
		update.changes.forEach(apply)
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
}
