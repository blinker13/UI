
#if os(iOS)

import UIKit

public final class Platform : UIResponder, UIApplicationDelegate {

	public typealias Options = [UIApplicationLaunchOptionsKey:Any]
	public typealias ViewController = UIViewController

	internal typealias Layer = CALayer
	internal typealias View = UIView

	public var window:UIWindow?

	public func application(_ application:UIApplication, didFinishLaunchingWithOptions launchOptions:Options? = nil) -> Bool {
		guard let scene = Application.shared.keyScene else { return false }
		let viewController = Scene.Controller(with:scene)
		window = UIWindow(frame:UIScreen.main.bounds)
		window?.rootViewController = viewController
		window?.makeKeyAndVisible()
		return true
	}
}

// MARK: -

internal extension Platform {
	static var bounds:CGRect {
		return .zero
	}
}

#endif
