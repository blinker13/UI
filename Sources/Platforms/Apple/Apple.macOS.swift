
#if os(OSX)

import AppKit

internal final class Apple {

	static func start() {
		open(Application.shared.keyWindow)
		NSApplication.shared.run()
	}

	static func open(_ window:Window) {
		let viewController = AppleViewController(with:window.scene)
		let mask:NSWindow.StyleMask = [.titled, .closable, .miniaturizable, .resizable, .fullSizeContentView]
		let new = NSWindow(contentRect:bounds, styleMask:mask, backing:.buffered, defer:false)
		new.contentMinSize = viewController.preferredMinimumSize
		new.contentMaxSize = viewController.preferredMaximumSize
		new.contentViewController = viewController
		new.titlebarAppearsTransparent = true
		new.titleVisibility = .hidden
		new.makeKeyAndOrderFront(nil)
	}

	static func stop() {
		NSApp.terminate(nil)
	}
}

// MARK: -

internal extension Apple {
	static var bounds:NSRect {
		guard let screen = NSScreen.main else { return .zero }

		let vertical = round(screen.frame.height * 0.15)
		let horizontal = round(screen.frame.width * 0.2)
		let rect = screen.frame.insetBy(dx:horizontal, dy:vertical)
		return rect.offsetBy(dx:0, dy:vertical * 0.3)
	}
}

#endif
