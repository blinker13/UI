
public struct Style {

	internal struct Value {
		internal let hash:Int
		internal let raw:Any
	}

	fileprivate let values:Set<Value>

	internal init (values:Set<Value>) {
		self.values = values
	}
}

public extension Style {

	init (_ styles:Style ...) {
		self.init(with:styles)
	}

	init (with styles:[Style]) {
		let reverse = styles.reversed()
		self.values = reverse.reduce(Set<Value>()) {
			return $0.union($1.values)
		}
	}

	init <Kind>(key:Attribute<Kind>, value:Kind) {
		let item = Value(hash:key.hashValue, raw:value)
		self.values = [item]
	}

	func get<Kind>(_ key:Attribute<Kind>) -> Kind? {
		let value = values.first { $0.hash == key.hashValue }
		return value?.raw as? Kind
	}
}

extension Style : ExpressibleByArrayLiteral {
	public init (arrayLiteral elements:Style ...) {
		self.init(with:elements)
	}
}

extension Style : Hashable {

	public static func == (left:Style, right:Style) -> Bool {
		return left.values == right.values
	}

	public var hashValue:Int {
		return values.hashValue
	}
}

extension Style.Value : Hashable {

	static func == (left:Style.Value, right:Style.Value) -> Bool {
		return left.hash == right.hash
	}

	var hashValue:Int {
		return hash
	}
}
