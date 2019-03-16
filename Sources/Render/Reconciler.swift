
internal struct Reconciler {

	private typealias Cache = [Key:Node]

	fileprivate struct Key : Hashable {
		private let alias:Alias
		private let scope:Scope
		private let index:Int
	}

	private var cache:Cache
}

// MARK: -

internal extension Reconciler {

	var remains:[Node] {
		return Array(cache.values)
	}

	init (with children:Node.Children) {
		let enumeration = children.enumerated()
		let initial = Cache(minimumCapacity:children.count)
		self.cache = enumeration.reduce(into:initial) {
			let key = Key(with:$1.element, at:$1.offset)
			return $0[key] = $1.element
		}
	}

	mutating func match(_ element:Element, at index:Int) -> Node? {
		let key = Key(with:element, at:index)
		return cache.removeValue(forKey:key)
	}
}

// MARK: -

private extension Reconciler.Key {

	static func == (left:Reconciler.Key, right:Reconciler.Key) -> Bool {
		switch (left.scope, right.scope) {
			case (.none, .none): return left.index == right.index
			case (.key(let l), .key(let r)): return l == r
			default: return false
		}
	}

	var hashValue:Int {
		return alias.hashValue
	}

	init (with element:Element, at index:Int) {
		self.alias = element.alias
		self.scope = element.scope
		self.index = index
	}
}
