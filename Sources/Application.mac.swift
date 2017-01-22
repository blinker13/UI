
#if os(OSX)

import AppKit

public final class Application {

	public static let shared = Application()

	fileprivate let app = NSApplication.shared()

	private init () {

	}
}

internal extension Application {

	func run(with component:Component) {
		let window = QuartzWindow(with:component)
		window.makeKeyAndOrderFront(nil)
		app.run()
	}
}

#endif
