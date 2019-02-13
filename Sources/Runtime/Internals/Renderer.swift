
internal struct Renderer : Encoder {
	internal let node:Node
}

// MARK: -

internal extension Renderer {

	var codingPath:[CodingKey] { return [] }
	var userInfo:[CodingUserInfoKey:Any] { return [:] }

	func container<Key>(keyedBy type:Key.Type) -> KeyedEncodingContainer<Key> where Key : CodingKey {
		let mapping = Mapping<Key>(renderer:self)
		return KeyedEncodingContainer(mapping)
	}

	func singleValueContainer() -> SingleValueEncodingContainer {
		fatalError("single value container not available")
	}

	func unkeyedContainer() -> UnkeyedEncodingContainer {
		fatalError("unkeyed container not available")
	}
}
