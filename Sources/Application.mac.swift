
#if os(OSX)

import AppKit

internal extension Application {

	func main() {
		let window = AppleWindow(with:Application.shared.window!)
		window.titlebarAppearsTransparent = true
		window.titleVisibility = .hidden
		window.makeKeyAndOrderFront(nil)
		NSApplication.shared()
		NSApp.run()
	}

	func exit() {
		NSApp.terminate(nil)
	}
}

#endif
