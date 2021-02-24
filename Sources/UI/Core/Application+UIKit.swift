
#if os(iOS)

import UIKit

public extension Application {

	static func main() {
		let delegate = NSStringFromClass(AppDelegate<Self>.self)
		UIApplicationMain(CommandLine.argc, CommandLine.unsafeArgv, nil, delegate)
	}
}

// MARK: -

private final class AppDelegate<App: Application> : UIResponder, UIApplicationDelegate {

	private let application: App = .init()

	func application(_ application: UIApplication, didFinishLaunchingWithOptions options: [UIApplication.LaunchOptionsKey:Any]? = nil) -> Bool {
		return true
	}

	func application(_ application: UIApplication, configurationForConnecting session: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
		let configuration = UISceneConfiguration(name: nil, sessionRole: session.role)
		configuration.delegateClass = SceneDelegate<App>.self
		return configuration
	}

	func application(_ application: UIApplication, didDiscardSceneSessions sessions: Set<UISceneSession>) {
		// TODO: implementation
	}
}

// MARK: -

private final class SceneDelegate<App: Application> : UIResponder, UIWindowSceneDelegate {

	var window: UIWindow?

	func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options: UIScene.ConnectionOptions) {
		guard let windowScene = scene as? UIWindowScene else { return }

		let window = UIWindow(windowScene: windowScene)
//		window.rootViewController =
		window.makeKeyAndVisible()
		self.window = window
	}
}

#endif
