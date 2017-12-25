
#if os(iOS)

import UIKit

internal final class Apple : UIResponder, UIApplicationDelegate {

	typealias Options = [UIApplicationLaunchOptionsKey:Any]

	var window:UIWindow?

	func application(_ application:UIApplication, didFinishLaunchingWithOptions launchOptions:Options? = nil) -> Bool {
		guard let scene = Application.shared.keyScene else { return false }
		let viewController = AppleViewController(with:scene)
		window = UIWindow(frame:UIScreen.main.bounds)
		window?.rootViewController = viewController
		window?.makeKeyAndVisible()
		return true
	}
}

#endif
