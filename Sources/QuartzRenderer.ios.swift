
#if os(iOS)

import UIKit

internal extension QuartzRenderer {

	func createLayer(`for` node:Node) -> CALayer {
		return node.parent == nil ? rootLayer : CALayer()
	}

	func fetchLayer(`for` node:Node) -> CALayer {
		return node.parent == nil ? rootLayer : content[node]!
	}
}

#endif
