
import Graphics
import UI


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
//		View(style:[.height(min:20.0), .background(.black), .padding(10.0)],
//			View(style:[.height(min:20.0), .width(min:10.0), .background(.yellow)]),
//			Button(style:[.width(min:40.0), .background(.blue)])
//		),
		View(style:[.height(min:40.0), .background(.green)])
	)
)
