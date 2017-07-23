
#if os(OSX)

import AppKit

internal extension Apple {
	internal final class View : NSView {

		override init(frame frameRect:NSRect) {
			super.init(frame:frameRect)
			layer = CALayer()
			wantsLayer = true
		}

		required init? (coder decoder:NSCoder) {
			fatalError("init(coder:) has not been implemented")
		}

		override var isFlipped:Bool {
			return true
		}
	}
}

#endif
