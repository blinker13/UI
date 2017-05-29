
import PlaygroundSupport
import Cocoa

@testable import UI

let s0 = Style(
	.background(.red),
	.height(44.0)
)

let s1 = Style(
	.background(.yellow),
	.border(radius:5, width:2),
	.width(min:80),
	.margin(20.0)
)

let s2 = Style(
	.align(.center),
	.background(.green),
//	.shadow(offset:3.0),
	.height(44.0)
)

let cs = Style(
//	.padding(5.0),
	.distribute(.ordered),
	.background(.white)
)

let container = Container(style:cs,
	Container(style:s0),
	Container(style:s1),
	Container(style:s2)
)

let vc = AppleViewController(with:container)
vc.view.frame = CGRect(x:0, y:0, width:320, height:480)
vc.viewWillLayout()
vc.viewDidLayout()

PlaygroundPage.current.liveView = vc.view
PlaygroundPage.current.needsIndefiniteExecution = true
