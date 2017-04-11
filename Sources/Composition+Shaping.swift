
public extension Composition {

	static func add(_ shapes:Shape ...) -> Composition {
		let actions = shapes.map { Composition.Action.addShape($0) }
		return self.init(with:actions)
	}

	static func add(_ elements:Path.Element ...) -> Composition {
		let path = Path(with:elements)
		return add(path)
	}
}
