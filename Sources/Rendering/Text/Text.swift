
public struct Text : CollectionType, Equatable, StringLiteralConvertible, TextType {

	public let content:String

	public var color:Color
	public var font:Font

	// MARK: -

	public init(content:String, color:Color = .black, font:Font = Font(name:"Arial", size:13.0)) {
		(self.content, self.color, self.font) = (content, color, font)
	}

	public init(unicodeScalarLiteral value:StringLiteralType) {
		self.init(stringLiteral:"\(value)")
	}

	public init(extendedGraphemeClusterLiteral value:String) {
		self.init(stringLiteral:value)
	}

	public init(stringLiteral value:String) {
		self.init(content:value)
	}

	// MARK: -

	public subscript (index:String.Index) -> Glyph {
		let character = content[index]
		return Glyph(character:character, color:color, font:font)
	}

	// MARK: -

	public var description:String {
		return "Text(\"\(content)\")"
	}

	public var startIndex:String.Index {
		return content.startIndex
	}

	public var endIndex:String.Index {
		return content.endIndex
	}
}

// MARK: -

public func == (left:Text, right:Text) -> Bool {
	return (left.content == right.content && left.color == right.color && left.font == right.font)
}
