
#if os(OSX)

import AppKit

internal extension Application {

	func main() {
		let bounds = Platform.bounds
		let viewController = Scene.Controller(with:Application.shared.keyScene)
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

	func exit() {
		NSApp.terminate(nil)
	}
}

#endif
