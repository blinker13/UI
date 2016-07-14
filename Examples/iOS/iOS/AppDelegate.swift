
import Canvas
import UIKit
import UI

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

	var window:UIWindow?

	let bar = Style(
		height:44.0
	)

	let navigation = Style(
		background:.red
	)

	let contentStyle = Style(
		alignment:.center,
		width:Dimensions(min:80),
		border:Border(radius:5, width:2),
		background:.yellow,
		margin:20.0
	)

	let tool = Style(
		background:.green
	)

	let root = Style(
		padding:Space(top:20.0),
		distribution:.order,
		background:.white
	)

	var content:Component {
		return View(style:root,
			View(style:[bar, navigation]),
			View(style:contentStyle),
			View(style:[bar, tool])
		)
	}

	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {

		let screen = UIScreen.main()
		let aWindow = UIWindow(frame:screen.bounds)
//		aWindow.rootViewController = QuartzViewController(component:content)
		aWindow.rootViewController = UIKitViewController(component:content)
		aWindow.makeKeyAndVisible()
		window = aWindow

		return true
	}
}

