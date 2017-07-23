
#if os(OSX)

import AppKit

internal extension Application {

	func open(_ window:Window) {
		let wrapper = Apple.Window(with:window)
		wrapper.titlebarAppearsTransparent = true
		wrapper.titleVisibility = .hidden
		wrapper.makeKeyAndOrderFront(nil)
		self.window = window
	}

	func main() {
		NSApplication.shared.run()
	}

	func exit() {
		NSApp.terminate(nil)
	}
}

#endif
