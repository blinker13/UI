
#if os(iOS)

import UIKit

internal final class ApplicationDelegate : UIResponder {
	internal var window: UIWindow?
}

extension ApplicationDelegate : UIApplicationDelegate {

	func application(_ app:UIApplication, willFinishLaunchingWithOptions options:[UIApplicationLaunchOptionsKey:Any]?) -> Bool {

		window = UIWindow(frame:UIScreen.main.bounds)
		window?.rootViewController = QuartzViewController(with:Application.shared.content!)
		window?.makeKeyAndVisible()

		return true
	}
}

#endif
