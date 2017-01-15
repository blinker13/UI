
import Cocoa
import XCPlayground

@testable import Canvas
@testable import UI

let s0 = Style(
	background: .red,
	height: Dimensions(min:70),
	width: 40.0
)

let s1 = Style(
	alignment: .center,
	background: .yellow,
	border: Border(radius:5, width:2),
	height: Dimensions(min:10, max:50),
	margin: 5.0,
	width: Dimensions(min:80)
)

let s2 = Style(
	alignment: .trailing,
	background: .green,
	height: 40.0,
	shadow: Shadow(offset:3.0),
	width: Dimensions(min:150)
)

let cs = Style(
	arrangement: .horizontal,
	background: .white,
	distribution: .order,
	height: 130.0,
	padding: 5.0,
	width: 400.0
)

let container = View(style:cs,
	View(style:s0),
	View(style:s1),
	View(style:s2)
)

let vc = QuartzViewController(component:container)
vc.viewWillLayout()

vc.view
