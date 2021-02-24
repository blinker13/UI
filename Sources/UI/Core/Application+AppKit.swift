
#if os(macOS)

import AppKit

public extension Application {

	static func main() {
		let delegate = AppDelegate<Self>()

		withExtendedLifetime(delegate) {
			let app = NSApplication.shared
			app.delegate = delegate
			app.run()
		}
	}
}

// MARK: -

private final class AppDelegate<App: Application> : NSResponder, NSApplicationDelegate {

	private let application: App = .init()

	func applicationDidFinishLaunching(_ notification: Notification) {
		// TODO: refactor default bounds calculations
		let rect = NSRect(x: 0, y: 0, width: 800, height: 600)
		let mask: NSWindow.StyleMask = [.titled, .closable, .miniaturizable, .resizable, .fullSizeContentView]
		let window = NSWindow(contentRect: rect, styleMask: mask, backing: .buffered, defer: false)
//		window.contentViewController = AppKitViewController(with: Scene())
//		window.contentMinSize = viewController.preferredMinimumSize
//		window.contentMaxSize = viewController.preferredMaximumSize
		window.titlebarAppearsTransparent = true
		window.titleVisibility = .hidden
		window.makeKeyAndOrderFront(nil)
		window.center()
	}
}

#endif
