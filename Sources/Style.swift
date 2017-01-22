
public protocol Stylable {
	var style:Style { get }
}

public struct Style {

	public struct Attribute {
		public let key:String
		public let value:Any
	}

	fileprivate let attributes: Set<Attribute>

	internal init (attributes: Set<Attribute>) {
		self.attributes = attributes
	}
}

public extension Style {

	init (with styles:[Style]) {
		let reverse = styles.reversed()
		self.attributes = reverse.reduce(Set<Attribute>()) {
			return $0.union($1.attributes)
		}
	}

	init (_ styles:Style ...) {
		self.init(with:styles)
	}

	init (key:String, value:Any) {
		let attribute = Attribute(key:key, value:value)
		self.attributes = [attribute]
	}

	func get<Value>(_ key:String) -> Value? {
		let attribute = attributes.first { $0.key == key }
		return attribute?.value as? Value
	}
}

extension Style : ExpressibleByArrayLiteral {
	public init (arrayLiteral elements:Style ...) {
		self.init(with:elements)
	}
}

extension Style.Attribute : Hashable {

	public static func == (left:Style.Attribute, right:Style.Attribute) -> Bool {
		return left.key == right.key
	}

	public var hashValue:Int {
		return key.hashValue
	}
}
