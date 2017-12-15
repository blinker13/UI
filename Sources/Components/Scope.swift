
public protocol Scopable {
	var scope:Scope { get }
}

public extension Scopable {

	var typeScope:Scope {
		let kind = type(of:self)
		let id = ObjectIdentifier(kind)
		return .id(id)
	}
}

// MARK: -

public enum Scope : Hashable {
	case id(ObjectIdentifier)
	case key(String)
	case tag(Int)
}

public extension Scope {

	static func == (left:Scope, right:Scope) -> Bool {
		switch (left, right) {
			case let (.id(l), .id(r)): return l == r
			case let (.key(l), .key(r)): return l == r
			case let (.tag(l), .tag(r)): return l == r
			default: return false
		}
	}

	var hashValue:Int {
		switch self {
			case let .id(x): return x.hashValue
			case let .key(x): return x.hashValue
			case let .tag(x): return x.hashValue
		}
	}
}
