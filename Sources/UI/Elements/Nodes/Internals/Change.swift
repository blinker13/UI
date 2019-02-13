
import Runtime

public struct Change : Hashable {

	public typealias Index = Int

	public enum Kind {
		case insert
		case update
		case remove
	}

	internal let element:Element
	internal let index:Index
	internal let kind:Kind
}

// MARK: -

public extension Change {

	static func == (left:Change, right:Change) -> Bool {
//		guard left.element === right.element else { return false }

		switch (left.element.scope, right.element.scope) {
			case (.none, .none): return left.index == right.index
			case (.key(let l), .key(let r)): return l == r
			default: return false
		}
	}

	var hashValue:Int {
		let kind = type(of:element)
		let id = ObjectIdentifier(kind)
		return id.hashValue
	}
}

// MARK: -

private extension Change {

	var scope:Scope {
		return element.scope
	}
}
