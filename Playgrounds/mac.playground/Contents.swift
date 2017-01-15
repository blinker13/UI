
import Cocoa
import XCPlayground

@testable import UI

let s0 = Style(
	.background(.red),
	.height(min:70.0),
	.width(40.0)
)

let s1 = Style(
	.alignment(.center),
	.background(.yellow),
	.border(radius:5, width:2),
	.height(min:10, max:50),
	.width(min:80),
	.margin(5.0)
)

let s2 = Style(
	.alignment(.trailing),
	.background(.green),
	.shadow(offset:3.0),
	.width(max:150),
	.height(40.0)
)

let cs = Style(
	.padding(5.0),
	.arrangement(.horizontal),
	.distribution(.order),
	.background(.white),
	.height(130.0),
	.width(400.0)
)

let container = View(style:cs,
	View(style:s0),
	View(style:s1),
	View(style:s2)
)

let vc = QuartzViewController(component:container)
vc.viewDidLayout()

vc.view
