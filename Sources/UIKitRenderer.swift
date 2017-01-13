
#if os(iOS)

import UIKit

internal final class UIKitRenderer : Renderer {

	internal var views = [Node:UIView]()
	internal let root:UIView

	internal init (root:UIView) {
		self.root = root
	}

	internal func insert(_ node:Node, at index:Int) {
		let view = createView(for:node)
		insert(view, with:node, at:index)
		update(view, with:node)
		views[node] = view
	}

	internal func update(_ node:Node) {
		let view = fetchView(for:node)
		update(view, with:node)
	}

	internal func remove(_ node:Node) {
		let view = views.removeValue(forKey:node)
		view?.removeFromSuperview()
	}
}

private extension UIKitRenderer {

	func createView(for node:Node) -> UIView {
		if node.parent == nil { return root }

		switch node.component {
			case is Label: return UILabel()
			default: return UIView()
		}
	}

	func fetchView(for node:Node) -> UIView {
		if node.parent == nil { return root }
		return views[node]!
	}

	func insert(_ view:UIView, with node:Node, at index:Int) {
		let parent = fetchView(for:node.parent!)
		parent.insertSubview(view, at:index)
	}

	func update(_ view:UIView, with node:Node) {
		view.frame = node.frame.quartz

		if let enclosure = node.component as? Enclosure {
			view.clipsToBounds = enclosure.overflow.isHidden
		}

		if let visual = node.component as? Visual {
			view.backgroundColor = visual.background?.uiColor

			view.layer.cornerRadius = CGFloat(visual.border?.radius ?? 0)
			view.layer.borderWidth = CGFloat(visual.border?.width ?? 0)
			view.layer.borderColor = visual.border?.color.quartz

			view.layer.shadowColor = visual.shadow?.color.quartz
			view.layer.shadowOffset = CGSize(width:CGFloat(visual.shadow?.offset.x ?? 0), height:CGFloat(-(visual.shadow?.offset.y ?? 0)))
			view.layer.shadowRadius = CGFloat(visual.shadow?.radius ?? 3)
			view.layer.shadowOpacity = Float(visual.shadow?.opacity ?? 0)
		}

		if let textual = node.component as? Textual {
			if let label = view as? UILabel {
				label.attributedText = textual.text.quartz
			} else {
				precondition(false)
			}
		}
	}
}

#endif
