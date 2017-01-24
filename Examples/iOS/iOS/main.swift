
import UI

let bar = Style(
	.background(.black),
	.height(44.0)
)

let contentStyle = Style(
	.alignment(.center),
	.background(.red),
	.width(min:80),
	.margin(20.0)
)

let tool = Style(
	.background(.yellow)
)

let root = Style(
	.background(.white),
	.distribution(.order)
)

Application.run(
	View(style:root,
	     View(style:bar),
	     View(style:contentStyle),
	     View(style:[bar, tool])
	)
)
