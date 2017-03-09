
#if os(iOS)

import UIKit

internal final class AppleWindow : UIWindow {

	internal init (with window:Window) {
		super.init(frame:UIScreen.main.bounds)
		rootViewController = AppleViewController(with:window)
	}

	internal required init? (coder aDecoder: NSCoder) {
		fatalError()
	}
}

#endif
