
#if os(OSX)

import AppKit

internal final class AppleWindow : NSWindow {

	internal init (with window:Window) {
		let rect = NSRect(x:100, y:100, width:200, height:200)
		let mask:NSWindowStyleMask = [.titled, .closable, .miniaturizable, .resizable, .fullSizeContentView]
		super.init(contentRect:rect, styleMask:mask, backing:.buffered, defer:false)
		let viewController = AppleViewController(with:window)
		contentMinSize = viewController.preferredMinimumSize
		contentMaxSize = viewController.preferredMaximumSize
		contentViewController = viewController
	}
}

#endif
