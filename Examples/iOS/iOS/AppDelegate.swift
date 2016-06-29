
import Canvas
import UIKit
import UI

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

	var window:UIWindow?

	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {

		let bar = Style(
			height:44.0
		)

		let s0 = Style(
			background:.red
		)

		let s1 = Style(
			alignment:.center,
			width:Dimensions(min:80),
			border:Border(radius:5, width:2),
			background:.yellow,
			margin:20.0
		)

		let s2 = Style(
			background:.green
		)

		let cs = Style(
			padding:Space(top:20.0),
			distribution:.order,
			background:.gray
		)
		
		let container = View(style:cs,
			View(style:[s0, bar]),
			View(style:s1),
			View(style:[s2, bar])
		)

		let screen = UIScreen.main()
		let aWindow = UIWindow(frame:screen.bounds)
		aWindow.rootViewController = QuartzViewController(component:container)
		aWindow.makeKeyAndVisible()
		window = aWindow

		return true
	}
}

