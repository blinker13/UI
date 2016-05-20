
import Cocoa
import XCPlayground
@testable import UI


let s0 = Style(
	height:Dimension(min:40),
	background:.red,
	width:40.0
)

let s1 = Style(
	alignment:.Center,
	width:Dimension(min:80),
	height:Dimension(min:10, max:50),
	border:Border(radius:5, width:2),
	background:.yellow,
	margin:10.0
)

let s2 = Style(
	alignment:.Trailing,
	width:Dimension(min:150),
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

let v0 = View(style:s0, components:[])
let v1 = View(style:s1, components:[])
let v2 = View(style:s2, components:[])

let container = View(style:cs, components:[v0, v1, v2])

let vc = QuartzViewController(component:container)
vc.viewWillLayout()
vc.view
