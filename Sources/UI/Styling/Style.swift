
public struct Style : Stylable, Hashable, CustomStringConvertible, ExpressibleByArrayLiteral {

	public typealias Compound = Set<Style>
	public typealias Value = Any// = Codable

	private let value:Value
	private let key:String
}

// MARK: -

public extension Style {

	static var empty:Style = []

	static func == (left:Style, right:Style) -> Bool {
		guard left.hashValue == right.hashValue else { return false }
		if left.isToken || right.isToken { return true }

		guard left.key == right.key else { return false }
		guard left.kind == right.kind else { return false }
		return true //TODO: check .value -> compare encoding ???
	}

	var description:String { return "\(key) -> \(value)" }
	var hashValue:Int { return key.hashValue }
	var style:Style { return self }
	
	init (key:String, value:Value) {
		self.value = value
		self.key = key
	}

	init (styles:[Style]) {
		// ???: needs reverse()
		let flat = styles.flatMap { $0.all }
		self.value = Compound(flat)
		self.key = "."
	}

	init (_ styles:Style ...) {
		self.init(styles:styles)
	}

	init (arrayLiteral elements:Style ...) {
		self.init(styles:elements)
	}

	subscript <Kind>(_ aKey:String) -> Kind? {
		if let next = forward?[aKey] { return next[aKey] }
		guard aKey == key else { return nil }
		return value as? Kind
	}
}

// MARK: -

private extension Style {

	static func tokenize(_ key:String) -> Style {
		return Style(key:key, value:key)
	}

	var all:[Style] {
		switch value {
			case let compound as Compound: return Array(compound)
			default: return [self]
		}
	}

	var isToken:Bool { return key == value as? String }
	var forward:Compound? { return value as? Compound }
	var kind:Value.Type { return type(of:value) }
}

// MARK: -

private extension Set where Element == Style {

	subscript (key:String) -> Style? {
		let token = Style.tokenize(key)
		guard let index = index(of:token) else { return nil }
		return self[index]
	}
}
