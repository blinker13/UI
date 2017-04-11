
import UI


#if os(OSX)

import Cocoa

let menubar = NSMenu()
let appMenuItem = NSMenuItem()
menubar.addItem(appMenuItem)

let appMenu = NSMenu()
let quitMenuItem = NSMenuItem(title:"Quit Cocoa", action:#selector(NSApplication.terminate), keyEquivalent:"q")
appMenu.addItem(quitMenuItem)
appMenuItem.submenu = appMenu

let app = NSApplication.shared()
app.mainMenu = menubar

#endif


// MARK: - Implementation

let root = Style(
	.background(.blue),
	.distribution(.ordered),
	.height(min:300.0),
	.width(min:400.0)
)

let bar = Style(
	.background(.white),
	.height(44.0)
)

let contentStyle = Style(
	.background(.orange),
	.margin(20.0)
)

Application.run(
	View(style:root,
        View(style:bar),
	    View(style:contentStyle),
	    View(style:bar)
	)
)
