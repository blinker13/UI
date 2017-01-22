
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
	.height(44.0)
)

let navigation = Style(
	.background(.red)
)

let contentStyle = Style(
	.alignment(.center),
	.background(.yellow),
	.width(min:80),
	.margin(20.0)
)

let tool = Style(
	.background(.green)
)

let root = Style(
//	.background(.white),
	.distribution(.order),
	.height(min:200.0),
	.width(min:200.0)
)

Application.run(
	View(style:root,
	     View(style:[bar, navigation]),
	     View(style:contentStyle),
	     View(style:[bar, tool])
	)
)


//let frame = NSRect(x:100, y:100, width:200, height:200)
//let styles:NSWindowStyleMask = [.titled, .closable, .miniaturizable, .resizable]
//let window = NSWindow(contentRect:frame, styleMask:styles, backing:.buffered, defer:false)
//window.contentViewController = QuartzViewController(with:content)
//window.makeKeyAndOrderFront(nil)
//
//let app = NSApplication.shared()
//app.mainMenu = menubar
//app.run()
