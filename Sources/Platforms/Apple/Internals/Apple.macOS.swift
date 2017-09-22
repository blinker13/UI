
#if os(OSX)

import AppKit

internal final class Apple : NSResponder {

	internal final class View : NSView {

		override var isFlipped:Bool { return true }

		override init(frame frameRect:NSRect) {
			super.init(frame:frameRect)
			layer = CALayer()
			wantsLayer = true
		}

		required init? (coder decoder:NSCoder) {
			fatalError("init(coder:) has not been implemented")
		}
	}

	internal final class Window : NSWindow {

		static var bounds:NSRect {
			guard let screen = NSScreen.main else { return .zero }

			let vertical = round(screen.frame.height * 0.15)
			let horizontal = round(screen.frame.width * 0.2)
			let rect = screen.frame.insetBy(dx:horizontal, dy:vertical)
			return rect.offsetBy(dx:0, dy:vertical * 0.3)
		}

		internal init (with window:UI.Window) {
			let mask:NSWindow.StyleMask = [.titled, .closable, .miniaturizable, .resizable, .fullSizeContentView]
			super.init(contentRect:Apple.Window.bounds, styleMask:mask, backing:.buffered, defer:false)
			let viewController = AppleViewController(with:window.scene)
			contentMinSize = viewController.preferredMinimumSize
			contentMaxSize = viewController.preferredMaximumSize
			contentViewController = viewController
		}
	}
}

extension Apple : NSApplicationDelegate {

//	func application(_ app:UIApplication, willFinishLaunchingWithOptions options:[UIApplicationLaunchOptionsKey:Any]?) -> Bool {
//
//		window = UIWindow(frame:UIScreen.main.bounds)
//		window?.rootViewController = QuartzViewController(with:Application.shared.content!)
//		window?.makeKeyAndVisible()
//
//		return true
//	}
}

#endif
