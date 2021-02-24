// swift-tools-version:5.3
import PackageDescription

_ = Package(
	name: "UI",

	products: [
		.library(name: "UI", targets: ["Canvas", "Geometry"]),
	],

	targets: [
		.target(name: "Canvas", dependencies: ["Geometry"]),
		.target(name: "Geometry"),
		.target(name: "Runtime"),

		.testTarget(name: "Tests", dependencies: ["Canvas", "Geometry"], path: "Tests"),
	]
)
