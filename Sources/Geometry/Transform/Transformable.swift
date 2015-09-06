
public protocol Transformable {
	func transformed(by transform:Transform) -> Self
}

public extension Transformable {

	func rotated(by angle:Float) -> Self {
		let transform = Transform(rotate:angle)
		return transformed(by:transform)
	}

	func scaled(by size:Size) -> Self {
		let transform = Transform(scale:size)
		return transformed(by:transform)
	}

	func translated(by point:Point) -> Self {
		let transform = Transform(translate:point)
		return transformed(by:transform)
	}
}

public extension Transformable {

	mutating func transform(by transform:Transform) {
		self = transformed(by:transform)
	}

	mutating func rotate(by angle:Float) {
		let transform = Transform(rotate:angle)
		self = transformed(by:transform)
	}

	mutating func scale(by size:Size) {
		let transform = Transform(scale:size)
		self = transformed(by:transform)
	}

	mutating func translate(by point:Point) {
		let transform = Transform(translate:point)
		self = transformed(by:transform)
	}
}
