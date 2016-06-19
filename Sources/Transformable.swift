
public protocol Transformable {
    func transformed(_ transform:Transform) -> Self
}

// MARK: -

public extension Transformable {

	final func rotated(_ angle:Unit) -> Self {
		let transform = Transform(rotated:angle)
		return transformed(transform)
	}

	final func scaled(_ width:Unit, height:Unit) -> Self {
		let transform = Transform(scaled:width, height)
		return transformed(transform)
	}

	final func translated(_ x:Unit, y:Unit) -> Self {
		let transform = Transform(translated:x, y)
		return transformed(transform)
	}
}
