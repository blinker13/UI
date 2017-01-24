
#if os(iOS)

import UIKit

internal final class AppleWindow : UIWindow {

	internal init (with window:Window) {
		super.init(frame:UIScreen.main.bounds)
		let viewController = AppleViewController(with:window)
		rootViewController = viewController
	}

	internal required init? (coder aDecoder: NSCoder) {
		fatalError()
	}
}

#endif
