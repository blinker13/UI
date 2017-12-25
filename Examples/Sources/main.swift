
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
	.background(.white),
	.distribute(.proportional),
	.height(min:300.0),
	.width(min:400.0),
	.padding(20.0)
)

Application.run(
	View(style:root,
		View(style:[.height(min:10.0), .background(.red)]),
		Horizontal(style:[.height(min:20.0), .background(.black), .padding(10.0)],
			View(style:[.height(min:20.0), .width(min:10.0), .background(.yellow)]),
			View(style:[.width(min:40.0), .background(.blue)])
		),
		View(style:[.height(min:40.0), .background(.green)])
	)
)

