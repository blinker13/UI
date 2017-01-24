
#if os(iOS)

import UIKit

internal final class Apple : UIResponder {
	internal static var name:String { return NSStringFromClass(self) }
	internal var window: UIWindow?
}

extension Apple : UIApplicationDelegate {

	func application(_ app:UIApplication, willFinishLaunchingWithOptions options:[UIApplicationLaunchOptionsKey:Any]?) -> Bool {
		window = AppleWindow(with:Application.shared.window!)
		window?.makeKeyAndVisible()
		return true
	}
}

#endif
