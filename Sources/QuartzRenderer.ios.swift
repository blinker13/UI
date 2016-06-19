
#if os(iOS)

import UIKit

internal final class QuartzRenderer {

	internal var content = [Node:CALayer]()
	internal let view:UIView

	internal init(view:UIView) {
		self.view = view
	}
}

internal extension QuartzRenderer {

	func createLayer(`for` node:Node) -> CALayer {
		return node.parent == nil ? view.layer : CALayer()
	}

	func fetchLayer(`for` node:Node) -> CALayer {
		return node.parent == nil ? view.layer : content[node]!
	}
}

#endif
