
#if os(OSX)

import AppKit

internal final class AppKitDelegate : NSObject, NSApplicationDelegate {

	func applicationDidFinishLaunching(_ notification: Notification) {
		guard let scene = Application.shared.keyScene else { return }
		guard let screen = NSScreen.main else { return }

		#warning("refactor default bounds calculation")
		let vertical = round(screen.frame.height * 0.15)
		let horizontal = round(screen.frame.width * 0.2)
		let rect = screen.frame.insetBy(dx:horizontal, dy:vertical)
		let bounds = rect.offsetBy(dx:0, dy:vertical * 0.3)

		#warning("remove window initialization")
		let mask:NSWindow.StyleMask = [.titled, .closable, .miniaturizable, .resizable, .fullSizeContentView]
		let new = NSWindow(contentRect:bounds, styleMask:mask, backing:.buffered, defer:false)
		new.contentViewController = AppKitViewController(with:scene)
//		new.contentMinSize = viewController.preferredMinimumSize
//		new.contentMaxSize = viewController.preferredMaximumSize
		new.titlebarAppearsTransparent = true
		new.titleVisibility = .hidden
		new.makeKeyAndOrderFront(nil)
	}
}

#endif
