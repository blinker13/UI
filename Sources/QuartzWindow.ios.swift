
#if os(iOS)

import UIKit

internal final class QuartzWindow : UIWindow {

	internal init (with window:Window) {
		super.init(frame:UIScreen.main.bounds)
		let viewController = QuartzViewController(with:window)
		rootViewController = viewController
	}

	internal required init? (coder aDecoder: NSCoder) {
		fatalError()
	}
}

#endif
