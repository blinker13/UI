
#if os(OSX)

	import AppKit

	internal final class QuartzRenderer {

		internal var content = [Node:CALayer]()
		internal let view:NSView

		// MARK: -

		internal init(view:NSView) {
			self.view = view
		}
	}

	// MARK: -

	internal extension QuartzRenderer {

		func createLayer(for node:Node) -> CALayer {
			return node.parent == nil ? view.layer! : CALayer()
		}

		func fetchLayer(for node:Node) -> CALayer {
			return node.parent == nil ? view.layer! : content[node]!
		}
	}

#endif
