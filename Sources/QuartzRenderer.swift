
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
			layer.backgroundColor = NSColor(calibratedRed:1.0, green:0.0, blue:0.0, alpha:1.0).CGColor
			parentLayer.insertSublayer(layer, atIndex:UInt32(index))
			print("insert node at [\(index)]")
		} else {
			layer.backgroundColor = NSColor.whiteColor().CGColor
			view.wantsLayer = true
			view.layer = layer
			layer.geometryFlipped = true
			print("insert root node")
		}

		content[node] = layer
	}

	internal func update(node:Node) {
		print("update node")
	}

	internal func remove(node:Node) {
		print("remove node")
	}
}
