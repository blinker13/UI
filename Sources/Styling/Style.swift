
import Core

public struct Style : ExpressibleByArrayLiteral {

	public typealias Key = String
	public typealias Value = Codable
	public typealias Attribute = (Key, Value)

	private enum Storage {
		case attributes([Key:Value])
		case compound([Style])
	}

	private let storage:Storage
}

// MARK: -

public extension Style {

	init (arrayLiteral elements:Style ...) {
		self.storage = .compound(elements)
	}

	init (_ attributes:Attribute ...) {
		let attributes = Dictionary(uniqueKeysWithValues:attributes)
		self.storage = .attributes(attributes)
	}

	subscript <Kind>(key:Key) -> Kind? {
		switch storage {
			case .attributes(let attributes): return attributes[key] as? Kind
			case .compound(let compound): return compound[key]
		}
	}
}

// MARK: -

private extension Style {

	subscript (key:Key) -> Value? {
		switch storage {
			case .attributes(let attributes): return attributes[key]
			case .compound(let compound): return compound[key]
		}
	}
}

// MARK: -

private extension Array where Element == Style {

	subscript <Kind>(key:Style.Key) -> Kind? {
		let values = lazy.compactMap { $0[key] as? Kind }
		return values.first
	}
}
