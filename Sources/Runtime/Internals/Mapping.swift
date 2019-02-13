
import Core

internal struct Mapping<Key:CodingKey> : KeyedEncodingContainerProtocol {
	internal let renderer:Renderer
}

// MARK: -

internal extension Mapping {

	var codingPath:[CodingKey] {
		return renderer.codingPath
	}

	func encodeNil(forKey key: Key) throws {
		_ = node.model.removeValue(forKey: key.stringValue)
		// FIXME: if value is returned needs update
	}

	func encode<T>(_ value: T, forKey key: Key) throws where T : Encodable {
		let x = Attribute(key:key.stringValue, value: value)
		_ = node.model.updateValue(value, forKey: key.stringValue)
		// FIXME: if value is returned needs update
		print("Node did update", key.stringValue)
	}

	func nestedUnkeyedContainer(forKey key: Key) -> UnkeyedEncodingContainer {
		fatalError(#function)
//		return renderer.unkeyedContainer()
	}

	func nestedContainer<NestedKey>(keyedBy keyType: NestedKey.Type, forKey key: Key) -> KeyedEncodingContainer<NestedKey> where NestedKey : CodingKey {
		fatalError(#function)
//		return renderer.container(keyedBy: keyType)
	}

	func superEncoder() -> Encoder {
		fatalError(#function)
//		return renderer
	}

	func superEncoder(forKey key: Key) -> Encoder {
		fatalError(#function)
//		return renderer
	}
}

// MARK: -

private extension Mapping {
	var node:Node { return renderer.node }
}
