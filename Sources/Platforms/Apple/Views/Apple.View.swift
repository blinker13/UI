
#if os(OSX)

import AppKit

internal extension Apple {
	internal final class View : NSView {
		override var isFlipped:Bool { return true }
	}
}

#endif

// MARK: -

#if os(iOS)

import UIKit

internal extension Apple {
	internal final class View : UIView {
		override func layoutSubviews() {
			for sublayer in layer.sublayers! {
				sublayer.frame = layer.bounds
			}
			super.layoutSubviews()
		}
	}
}

#endif
