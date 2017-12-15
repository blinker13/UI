
internal struct Trace : Hashable {
	let model:Element
	let position:Int
	let origin:Int
}

// MARK: -

internal extension Trace {

	static func == (left:Trace, right:Trace) -> Bool {
		return left.hashValue == right.hashValue
	}

	var hashValue:Int {
		let scopee = model as? Scopable
		let value = scopee?.scope.hashValue
		return value ?? id.hashValue
	}

	var node:Node {
		return model as! Node
	}
}

// MARK: -

private extension Trace {
	var id:ObjectIdentifier {
		return ObjectIdentifier(Trace.self)
	}
}
