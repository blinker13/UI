
#if os(OSX)

import AppKit

internal final class ApplicationDelegate : NSResponder {}

extension ApplicationDelegate : NSApplicationDelegate {

//	func application(_ app:UIApplication, willFinishLaunchingWithOptions options:[UIApplicationLaunchOptionsKey:Any]?) -> Bool {
//
//		window = UIWindow(frame:UIScreen.main.bounds)
//		window?.rootViewController = QuartzViewController(with:Application.shared.content!)
//		window?.makeKeyAndVisible()
//
//		return true
//	}
}

#endif
