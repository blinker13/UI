
import PackageDescription

let package = Package(
	name: "UI",

	dependencies:[
		.Package(url: "https://github.com/blinker13/Canvas.git", majorVersion: 0),
		.Package(url: "https://github.com/blinker13/Geometry.git", majorVersion: 1)
	]
)
