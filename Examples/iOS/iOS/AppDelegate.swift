
import Canvas
import UIKit
import UI

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

	var window:UIWindow?

	let bar = Style(
		height:44.0
	)

	let label = Style(
		background:Color(white:0.9),
		textAlignment:.center,
		textColor:.red
	)

	let navigation = Style(
		background:.red
	)

	let contentStyle = Style(
		alignment:.center,
		background:.yellow,
		border:Border(radius:5, width:2),
		margin:20.0,
		width:Dimensions(min:80)
	)

	let tool = Style(
		background:.green
	)

	let root = Style(
		background:.white,
		distribution:.order,
		padding:Space(top:20.0)
	)

	var content:Component {
		return View(style:root,
			View(style:[bar, navigation]),
			Label(style:[bar, label], text:"Hello World"),
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

