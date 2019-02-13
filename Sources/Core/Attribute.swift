
public struct Attribute<Key, Value> where Key : Hashable {
	public let value:Value
	public let key:Key
}

// MARK: -

public extension Attribute {

	var hashValue:Int { return key.hashValue }

	init (key:Key, value:Value) {
		self.value = value
		self.key = key
	}
}

// MARK: -

extension Attribute : CustomStringConvertible {
	public var description:String { return "<\(key) : \(value)>" }
}

extension Attribute : Hashable {
	public static func == (left:Attribute, right:Attribute) -> Bool {
		return left.key == right.key
	}
}

extension Attribute where Value : Equatable {
	public static func == (left:Attribute, right:Attribute) -> Bool {
		return left.key == right.key && left.value == right.value
	}
}

extension Attribute : Decodable where Key : Decodable, Value : Decodable {}
extension Attribute : Encodable where Key : Encodable, Value : Encodable {}
