// swift-tools-version:5.3
import PackageDescription

_ = Package(
	name: "UI",

	products: [
		.library(name: "UI", targets: ["Canvas", "Geometry"]),
	],

	targets: [
		.target(name: "Canvas"),
		.target(name: "Geometry"),
		.testTarget(name: "Tests", dependencies: ["Canvas", "Geometry"], path: "Tests"),
	]
)
