
#if os(iOS)

import UIKit

internal extension Apple {
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
}

#endif
