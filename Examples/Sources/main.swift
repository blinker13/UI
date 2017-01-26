
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

let bar = Style(
	.background(.black),
	.height(44.0)
)

let contentStyle = Style(
	.alignment(.center),
	.background(.red),
	.width(min:80),
	.margin(20.0)
)

let tool = Style(
	.background(.yellow)
)

let root = Style(
	.width(min:300.0),
	.height(min:300.0),
	.background(.white),
	.distribution(.order)
)

Application.run(
	View(style:root,
	     View(style:bar),
	     View(style:contentStyle),
	     View(style:[bar, tool])
	)
)
