
#if os(iOS)

import UIKit

internal extension Application {

	private final class Delegate : UIResponder, UIApplicationDelegate {

		var window:UIWindow?

		func application(_ application:UIApplication, didFinishLaunchingWithOptions launchOptions:[UIApplication.LaunchOptionsKey:Any]? = nil) -> Bool {
			guard let scene = Application.shared.keyScene else { return false }
			let viewController = UIKitViewController(with:scene)
			window = UIWindow(frame:UIScreen.main.bounds)
			window?.rootViewController = viewController
			window?.makeKeyAndVisible()
			return true
		}
	}

	func main() {
		let delegate = NSStringFromClass(Delegate.self)
		UIApplicationMain(CommandLine.argc, CommandLine.unsafeArgv, nil, delegate)
	}

	func exit() {
		Darwin.exit(EXIT_SUCCESS)
	}
}

#endif
