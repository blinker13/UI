
import Canvas
import UIKit
import UI

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window:UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {

        let s0 = Style(
            height:Length(min:70),
            background:.red,
            width:40.0
        )

        let s1 = Style(
            alignment:.center,
            width:Length(min:80),
            height:Length(min:10, max:50),
            border:Border(radius:5, width:2),
            background:.yellow,
            margin:5.0
        )

        let s2 = Style(
            alignment:.trailing,
            width:Length(min:150),
            shadow:Shadow(offset:3.0),
            background:.green,
            height:40.0
        )

        let cs = Style(
            arrangement:.horizontal,
            distribution:.order,
            background:.white,
            padding:5.0
        )
        
        let container = View(style:cs,
            View(style:s0),
            View(style:s1),
            View(style:s2)
        )

        let screen = UIScreen.main()
        let aWindow = UIWindow(frame:screen.bounds)
        aWindow.rootViewController = QuartzViewController(component:container)
        aWindow.makeKeyAndVisible()
        window = aWindow

        return true
    }
}

