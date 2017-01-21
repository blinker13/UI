
import Cocoa
import XCPlayground

@testable import UI

let s0 = Style(
	.background(.red),
	.height(70.0),
	.width(50.0)
)

let s1 = Style(
	.alignment(.trailing),
	.background(.yellow),
	.border(radius:5, width:2),
	.height(min:10, max:40),
	.width(min:80),
	.margin(5.0)
)

let s2 = Style(
	.alignment(.center),
	.background(.green),
//	.shadow(offset:3.0),
	.width(max:150),
	.height(30.0)
)

let cs = Style(
	.padding(5.0),
	.arrangement(.horizontal),
	.distribution(.equal),
	.background(.white),
	.height(100.0),
	.width(300.0)
)

let container = View(style:cs,
	View(style:s0),
	View(style:s1),
	View(style:s2)
)

let vc = QuartzViewController(component:container)
vc.viewDidLayout()

vc.view
