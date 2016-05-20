
import AppKit
import QuartzCore

internal final class QuartzRenderer : Renderer {

	private var content = [Node:CALayer]()
	private let view:NSView

	// MARK: -

	internal init(_ view:NSView) {
		self.view = view
	}

	// MARK: - Renderer

	internal func insert(node:Node, at index:Int) {

		let layer = CALayer()
		layer.frame = CGRect(x:node.frame.origin.x, y:node.frame.origin.y, width:node.frame.size.width, height:node.frame.size.height)

		if let parentNode = node.parent {
			let parentLayer = content[parentNode]!
			parentLayer.insertSublayer(layer, atIndex:UInt32(index))
			print("insert node at [\(index)]")
		} else {
			view.wantsLayer = true
			view.layer = layer
			layer.geometryFlipped = true
			print("insert root node")
		}

		update(layer, with:node)
		content[node] = layer
	}

	internal func update(node:Node) {
		let layer = content[node]!
		update(layer, with:node)
		print("update node")
	}

	internal func remove(node:Node) {
		print("remove node")
	}
}

// MARK: -

extension QuartzRenderer {
	private func update(layer:CALayer, with node:Node) {
		guard let visual = node.component as? Visual else { return }
		layer.backgroundColor = visual.background?.quartz

		layer.cornerRadius = CGFloat(visual.border?.radius ?? 0)
		layer.borderWidth = CGFloat(visual.border?.width ?? 0)
		layer.borderColor = visual.border?.color.quartz

		layer.shadowColor = visual.shadow?.color.quartz
		layer.shadowOffset = CGSize(width:visual.shadow?.offset.x ?? 0, height:-(visual.shadow?.offset.y ?? 0))
		layer.shadowRadius = CGFloat(visual.shadow?.radius ?? 3)
		layer.shadowOpacity = Float(visual.shadow?.opacity ?? 0)
	}
}
