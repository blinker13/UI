
public extension Composition {

	static func save() -> Composition {
		return self.init(.save)
	}

	static func restore() -> Composition {
		return self.init(.restore)
	}

	static func stage(_ compositions:Composition ...) -> Composition {
		let actions = compositions.flatMap { $0.actions }

		var compound:[Composition.Action] = [.save]
		compound.append(contentsOf:actions)
		compound.append(.restore)

		return self.init(actions:compound)
	}
}
