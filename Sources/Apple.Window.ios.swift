
#if os(iOS)

import UIKit

internal extension Apple {
	internal final class Window : UIWindow {

		internal init (with window:UI.Window) {
			super.init(frame:UIScreen.main.bounds)
			rootViewController = AppleViewController(with:window.scene)
		}

		internal required init? (coder aDecoder: NSCoder) {
			fatalError()
		}
	}
}

#endif
