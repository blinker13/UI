
import Cocoa
import XCPlayground
@testable import UI

var v1 = View(components:[])
//v1.alignment = .Center
v1.width = 60.0
v1.height = Dimension(min:40)

var v2 = View(components:[])
v2.margin = 5.0
//v2.margin.top = 10.0
v2.alignment = .Center
v2.width = Dimension(min:80)
v2.height = Dimension(min:10, max:50)

var v3 = View(components:[])
//v3.margin.right = 10.0
v3.alignment = .Trailing
v3.width = Dimension(min:20)
v3.height = 40.0

var container = View(components:[v1, v2, v3])
container.contentAlignment = .Leading
container.arrangement = .Horizontal
container.distribution = .Equal
container.padding = 10.0
container.width = 400.0
container.height = 130.0

let vc = QuartzViewController(component:container)
vc.viewWillLayout()
vc.view
