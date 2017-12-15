
#if os(iOS)

import UIKit

internal final class Apple : UIResponder {

	internal final class View : UIView {
		override var isMultipleTouchEnabled:Bool {
			get { return true }
			set {}
		}
	}

	internal final class Window : UIWindow {

		internal init (with window:UI.Window) {
			super.init(frame:UIScreen.main.bounds)
			rootViewController = AppleViewController(with:window.scene)
		}

		internal required init? (coder aDecoder: NSCoder) {
			fatalError()
		}

		override func sendEvent(_ event: UIEvent) {
			print("send", "->", event)
			super.sendEvent(event)
		}

		override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
			print("hit this", event!)
			return super.hitTest(point, with:event)
		}
	}

	internal static var name:String {
		return NSStringFromClass(self)
	}

	internal var window: UIWindow?
}

extension Apple : UIApplicationDelegate {

	func application(_ app:UIApplication, willFinishLaunchingWithOptions options:[UIApplicationLaunchOptionsKey:Any]?) -> Bool {
		window = Apple.Window(with:Application.shared.window!)
		window?.makeKeyAndVisible()
		return true
	}
}

#endif
