
#if os(OSX)

import AppKit

internal extension Application {

	func main() {
		#warning("remove menu logic")

		let menubar = NSMenu()
		let appMenuItem = NSMenuItem()
		menubar.addItem(appMenuItem)

		let appMenu = NSMenu()
		let quitMenuItem = NSMenuItem(title:"Quit Cocoa", action:#selector(NSApplication.terminate), keyEquivalent:"q")
		appMenu.addItem(quitMenuItem)
		appMenuItem.submenu = appMenu

		let app = NSApplication.shared
		let delegate = AppKitDelegate()
		app.delegate = delegate
		app.mainMenu = menubar
		app.run()
	}
}

#endif
