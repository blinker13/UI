
#if os(OSX)

import AppKit

internal extension Application {

	func main() {
		let window = QuartzWindow(with:content!)
		window.titlebarAppearsTransparent = true
		window.titleVisibility = .hidden
		window.makeKeyAndOrderFront(nil)
		NSApplication.shared()
		NSApp.run()
	}
}

#endif
