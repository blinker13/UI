
public enum Scope : Equatable, ExpressibleByStringLiteral {
	case key(String)
	case none
}

// MARK: -

public extension Scope {

	static func == (left:Scope, right:Scope) -> Bool {

		switch (left, right) {
		case (.key(let l), .key(let r)): return l == r
		case (.none, .none): return true
		default: return false
		}
	}

	init (unicodeScalarLiteral value:StringLiteralType) {
		self = .key(value)
	}

	init (extendedGraphemeClusterLiteral value:String) {
		self = .key(value)
	}

	init (stringLiteral value:String) {
		self = .key(value)
	}
}
