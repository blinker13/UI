
import UIKit
import UI

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

	var window:UIWindow?

	let bar = Style(
		.height(44.0)
	)

	let navigation = Style(
		.background(.red)
	)

	let contentStyle = Style(
		.alignment(.center),
		.background(.yellow),
		.width(min:80),
		.margin(20.0)
	)

	let tool = Style(
		.background(.green)
	)

	let root = Style(
		.background(.white),
		.distribution(.order)
	)

	var content:Component {
		return View(style:root,
			View(style:[bar, navigation]),
			View(style:contentStyle),
			View(style:[bar, tool])
		)
	}

	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey : Any]? = nil) -> Bool {

		let aWindow = UIWindow(frame:UIScreen.main.bounds)
		aWindow.rootViewController = QuartzViewController(with:content)
		aWindow.makeKeyAndVisible()
		window = aWindow

		return true
	}
}

