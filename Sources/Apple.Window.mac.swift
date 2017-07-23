
#if os(OSX)

import AppKit

internal extension Apple {
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

#endif
