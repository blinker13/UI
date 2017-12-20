
import Graphics
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
	.distribute(.ordered),
	.height(min:300.0),
	.width(min:400.0)
)

let bar = Style(
	.background(.white),
	.height(44.0)
)

let content = Style(
	.background(.orange),
	.tint(.red),
	.margin(50.0)
)

let title = Style(
	.background(.yellow),
//	.font(name:"Avenir Next", size:13.0),
	.tint(.black)
)

Application.run(
	View(style:root,
		View(style:bar),
		View(style:content),
//		Button(style:content) { print("Hello World") },
		View(style:bar//,
//			Text("Hello World", style:title)
		)
	)
)

