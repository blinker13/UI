
#if os(OSX)

import QuartzCore

internal final class AppleLayer : CALayer {
	override var isGeometryFlipped:Bool {
		get { return true }
		set {}
	}
}

#endif
