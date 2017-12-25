
#if os(OSX)

import AppKit

internal final class Apple {

	static func start() {
		let viewController = AppleViewController(with:Application.shared.keyScene)
		let mask:NSWindow.StyleMask = [.titled, .closable, .miniaturizable, .resizable, .fullSizeContentView]
		let new = NSWindow(contentRect:bounds, styleMask:mask, backing:.buffered, defer:false)
		new.contentViewController = viewController //TODO: beautify
		new.contentMinSize = viewController.preferredMinimumSize
		new.contentMaxSize = viewController.preferredMaximumSize
		new.titlebarAppearsTransparent = true
		new.titleVisibility = .hidden
		new.makeKeyAndOrderFront(nil)
		NSApplication.shared.run()
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
