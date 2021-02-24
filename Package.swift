// swift-tools-version:5.3
import PackageDescription

_ = Package(
	name: "UI",

	products: [
		.library(name: "UI", targets: ["Canvas", "Geometry", "UI"]),
	],

	targets: [
		.target(name: "Canvas", dependencies: ["Geometry"]),
		.target(name: "Geometry"),
		.target(name: "Runtime"),
		.target(name: "UI"),

		.testTarget(name: "Tests", dependencies: ["Canvas", "Geometry"], path: "Tests"),
	]
)
