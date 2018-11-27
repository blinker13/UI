
#if os(iOS)

import UIKit

internal extension UITouchPhase {

	var touchPhase:Touch.Phase {
		switch self {
			case .began: return .began
			case .moved: return .moved
			case .stationary: return .stationary
			case .ended: return .ended
			case .cancelled: return .cancelled
		}
	}
}

#endif
