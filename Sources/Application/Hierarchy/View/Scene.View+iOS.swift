
#if os(iOS)

import UIKit

internal extension Scene.View {

	override func layoutSubviews() {
		for sublayer in layer.sublayers! {
			sublayer.frame = layer.bounds
		}
		super.layoutSubviews()
	}

	func mount(_ layer:Scene.Layer) {
		self.layer.addSublayer(layer)
	}
}

#endif
