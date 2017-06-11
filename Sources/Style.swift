
public protocol Styling {
	var key:Style.Key { get }
	associatedtype Kind
}

public enum Style {

	public typealias Key = ObjectIdentifier
	public typealias Styles = [Style]

	public struct Value {
		public let key:Key
		public let raw:Any
	}

	case compound(Styles)
	case value(Value)
}

public extension Style {

	init (with styles:[Style]) {
		self = .compound(styles)
	}

	init (_ styles:Style ...) {
		self = .compound(styles)
	}

	init <Kind>(attribute:Attribute<Kind>, raw:Kind) {
		let value = Value(key:attribute.key, raw:raw)
		self = .value(value)
	}

	func get<Kind>(_ attribute:Attribute<Kind>) -> Kind? {
		return get(attribute.key)
	}
}

internal extension Style {
	func wrap(_ styles:Styles) -> Style {
		if styles.count == 1 { return styles.first! }
		else { return .compound(styles) }
	}
}

extension Style : ExpressibleByArrayLiteral {
	public init (arrayLiteral elements:Style ...) {
		self = .compound(elements)
	}
}

extension Style : Hashable {

	public static func == (left:Style, right:Style) -> Bool {
		return left.hashValue == right.hashValue
	}

	public var hashValue:Int {

		switch self {
			case let .compound(styles): return styles.hashed()
			case let .value(value): return value.key.hashValue
		}
	}
}

extension Style.Value : Hashable {

	public static func == (left:Style.Value, right:Style.Value) -> Bool {
		return left.hashValue == right.hashValue
	}

	public var hashValue:Int {
		return key.hashValue
	}
}

private extension Style {

	func get(_ key:Key) -> Value? {

		switch self {
			case let .compound(styles): return styles.get(key)
			case let .value(value) where value.key == key: return value
			default: return nil
		}
	}

	func get<Kind>(_ key:Key) -> Kind? {
		let value:Value? = get(key)
		return value?.raw as? Kind
	}
}

private extension Array where Element == Style {

	func get(_ key:Style.Key) -> Style.Value? {

		for style in reversed() {
			if let value:Style.Value = style.get(key) {
				return value
			}
		}

		return nil
	}

	func hashed() -> Int {
		let set = Set(self)
		return set.hashValue
	}
}
