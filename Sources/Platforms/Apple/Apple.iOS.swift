
#if os(iOS)

import UIKit
import Foundation

internal final class Apple : UIResponder, UIApplicationDelegate {

	static func start() {
		let count = Int(CommandLine.argc)
		let delegate = NSStringFromClass(self)
		let destination = UnsafeMutablePointer<Int8>.self
		let rawUnsafeArgv = UnsafeMutableRawPointer(CommandLine.unsafeArgv)
		let argv = rawUnsafeArgv.bindMemory(to:destination, capacity:count)
		UIApplicationMain(CommandLine.argc, argv, nil, delegate)
	}

	static func stop() {
		exit(EXIT_SUCCESS)
	}

	internal var window:UIWindow?
}

// MARK: -

internal extension Apple {

	typealias Options = [UIApplicationLaunchOptionsKey:Any]

	func application(_ application:UIApplication, didFinishLaunchingWithOptions launchOptions:Options? = nil) -> Bool {
		guard let scene = Application.shared.keyWindow?.scene else { return false }

		let viewController = AppleViewController(with:scene)
		window = UIWindow(frame:UIScreen.main.bounds)
		window?.rootViewController = viewController
		window?.makeKeyAndVisible()

		return true
	}
}

#endif
