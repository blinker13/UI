
public struct Alias : Hashable {
	private let isa:ObjectIdentifier
}

// MARK: -

public extension Alias {

	static func == (left:Alias, right:Alias) -> Bool {
		return left.isa == right.isa
	}

	var hashValue:Int {
		return isa.hashValue
	}
}

// MARK: -

internal extension Alias {

	init (_ kind:Any.Type) {
		self.isa = ObjectIdentifier(kind)
	}

	init (_ any:Any) {
		let kind = type(of:any)
		self.init(kind)
	}
}
