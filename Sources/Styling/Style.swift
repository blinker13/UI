
public struct Style {

	public typealias Compound = [Style]
	public typealias Identifier = String
	public typealias Value = Codable

	private let identifier:Identifier
	private let value:Value
}

public extension Style {

	static let compound = Attribute<Compound>("compound")
	var compound:Compound? { return value as? Compound }

	init <Kind>(key:Attribute<Kind>, value:Kind) {
		self.identifier = key.name
		self.value = value
	}

	init (with styles:Compound) {
		self.init(key:Style.compound, value:styles)
	}

	init (_ styles:Style ...) {
		self.init(with:styles)
	}

	subscript <Kind>(key:Attribute<Kind>) -> Kind? {

		switch value {
			case let x as Kind: print(self, key, "->", x);return x
			case let compound as Compound: return compound[key]
			default: return nil
		}
	}
}

extension Style : Equatable {
	public static func == (left:Style, right:Style) -> Bool {
		return left.identifier == right.identifier// && left.value == right.value
	}
}

extension Style : ExpressibleByArrayLiteral {
	public init (arrayLiteral elements:Style ...) {
		self.init(with:elements)
	}
}

public extension Array where Element == Style {
	subscript <Kind>(key:Attribute<Kind>) -> Kind? {

		for style in reversed() {
			if let value = style[key] {
				return value
			}
		}

		return nil
	}
}
