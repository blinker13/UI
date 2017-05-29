
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
	.margin(20.0)
)

Application.run(
	Container(style:root,
        Container(style:bar),
        Canvas(style:content) { rect in
            let space = Space(top:10, left:20, bottom:30, right:40)
            let border = rect.inset(space)

            return Composition(
                .setLineWidth(5),
                .add(border),
                .stroke
            )
        },
	    Container(style:bar)
	)
)
