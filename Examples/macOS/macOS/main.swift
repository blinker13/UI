
import Cocoa
import UI

// MARK: -

let menubar = NSMenu()
let appMenuItem = NSMenuItem()
menubar.addItem(appMenuItem)

let appMenu = NSMenu()
let quitMenuItem = NSMenuItem(title:"Quit Cocoa", action:#selector(NSApplication.terminate), keyEquivalent:"q")
appMenu.addItem(quitMenuItem)
appMenuItem.submenu = appMenu

let app = NSApplication.shared()
app.mainMenu = menubar


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
	.background(.white),
	.distribution(.order),
	.height(min:200.0),
	.width(min:300.0, max:500.0)
)

Application.run(
	View(style:root,
		View(style:bar),
		View(style:contentStyle),
		View(style:[bar, tool])
	)
)














