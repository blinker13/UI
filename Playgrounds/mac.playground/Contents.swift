
import Cocoa
import XCPlayground
@testable import UI


let s0 = Style(
	height:Dimensions(min:70),
	background:.red,
	width:40.0
)

let s1 = Style(
	alignment:.Center,
	width:Dimensions(min:80),
	height:Dimensions(min:10, max:50),
	border:Border(radius:5, width:2),
	background:.yellow,
	margin:5.0
)

let s2 = Style(
	alignment:.Trailing,
	width:Dimensions(min:150),
	shadow:Shadow(offset:3.0),
	background:.green,
	height:40.0
)

let cs = Style(
	arrangement:.Horizontal,
	distribution:.Order,
	background:.white,
	padding:5.0,
	width:400.0,
	height:130.0
)

let container = View(style:cs,
	View(style:s0),
	View(style:s1),
	View(style:s2)
)

let vc = QuartzViewController(component:container)
vc.viewWillL