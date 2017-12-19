
public struct Style {

	public typealias Compound = [Style]
	public typealias Identifier = String
	public typealias Value = Codable

	private let identifier:Identifier
	private let value:Value
}

public extension Style {

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
		if let compound = value as? Compound { return compound[key] }
		guard key.name == identifier else { return nil }
		return value as? Kind
	}
}

private extension Style {
	static let compound = Attribute<Compound>("[Style]")
	var compound:Compound? { return value as? Compound }
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
