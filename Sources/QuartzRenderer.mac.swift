
#if os(OSX)

import AppKit

internal extension QuartzRenderer {

	func createLayer(for node:Node) -> CALayer {
		return node.parent == nil ? view.layer! : CALayer()
	}

	func fetchLayer(for node:Node) -> CALayer {
		return node.parent == nil ? view.layer! : content[node]!
	}
}

#endif
