
#if os(OSX)
import AppKit
#elseif os(iOS)
import UIKit
#endif

internal extension Scene {

	internal typealias Layer = Platform.Layer

	internal final class View : Platform.View {

		private var layers = [Node:Layer]()
		private let renderer:Renderer

		internal init (scene:Scene, renderer:Renderer) {
			let root = Layer(with:scene)
			self.renderer = renderer

			super.init(frame:Platform.bounds)

			mount(root)
			add(root)
		}

		internal required init? (coder:NSCoder) {
			fatalError()
		}
	}
}

// MARK: -

internal extension Scene.View {

	convenience init (with scene:Scene) {
		self.init(scene:scene, renderer:Renderer())
	}

	func render(_ change:Change) {
		switch change.kind {
			case .insert(let index): insert(change.node, at:index)
			case .move(let index): move(change.node, to:index)
			case .update: update(change.node)
			case .remove: remove(change.node)
		}
	}
}

// MARK: -

private extension Scene.View {

	func insert(_ node:Node, at index:Int) {
		guard let key = node.parent else { fatalError() }
		guard let parent = layers[key] else { fatalError() }

		let layer = CALayer(with:node)
		parent.insert(layer, at:index)
		add(layer)
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

		layer.opacity = node.opacity

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

	func add(_ layer:CALayer) {
		layers[layer.node] = layer
		layer.delegate = renderer
	}

	func remove(_ node:Node) {
		let layer = layers.removeValue(forKey:node)!
		layer.removeFromSuperlayer()
	}
}
