
#if os(OSX)

import AppKit

internal final class QuartzWindow : NSWindow {

	internal init (with window:Window) {
		let rect = NSRect(x:100, y:100, width:200, height:200)
		let mask:NSWindowStyleMask = [.titled, .closable, .miniaturizable, .resizable]
		super.init(contentRect:rect, styleMask:mask, backing:.buffered, defer:false)
		contentViewController = QuartzViewController(with:window)
	}
}

#endif
