
#if os(OSX)

import AppKit
import Geometry

internal extension NSEvent {

	var touchPhase:Touch.Phase {
		switch type {
			case .leftMouseDown, .rightMouseDown, .otherMouseDown: return .began
			case .leftMouseDragged, .rightMouseDragged, .otherMouseDragged: return .moved
			case .leftMouseUp, .rightMouseUp, .otherMouseUp: return .ended
			default: fatalError()
		}
	}
}

#endif
