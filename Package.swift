// swift-tools-version:5.3
import PackageDescription

_ = Package(
	name: "UI",

	products: [
		.library(name: "UI", targets: ["Geometry"]),
	],

	targets: [
		.target(name: "Geometry"),
		.testTarget(name: "Tests", dependencies: ["Geometry"], path: "Tests"),
	]
)
