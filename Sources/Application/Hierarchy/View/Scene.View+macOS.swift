
#if os(OSX)

import AppKit

internal extension Scene.View {

	override var isFlipped:Bool {
		return true
	}

	func mount(_ layer:Scene.Layer) {
		self.layer = layer
		wantsLayer = true
	}
}

#endif
