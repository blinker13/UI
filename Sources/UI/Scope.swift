
public protocol Scopable {
	var scope:Scope { get }
}

// MARK: -

public enum Scope : Hashable, Scopable {

	case id(ObjectIdentifier)
	case key(String)
	case tag(Int)

	public init (_ this:Swift.AnyObject) {
		let identifier = ObjectIdentifier(this)
		self = .id(identifier)
	}
}

// MARK: -

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

	var scope:Scope {
		return self
	}
}
