
public protocol TextType : CollectionType, StringLiteralConvertible {
	subscript (index:String.Index) -> Glyph { get }
	var content:String { get }
	init(content:String)
}

// MARK: -

extension TextType {

	public init(unicodeScalarLiteral value:StringLiteralType) {
		self.init(content:"\(value)")
	}

	public init(extendedGraphemeClusterLiteral value:String) {
		self.init(content:value)
	}

	public init(stringLiteral value:String) {
		self.init(content:value)
	}

	// MARK: -

	public var startIndex:String.Index {
		return content.startIndex
	}

	public var endIndex:String.Index {
		return content.endIndex
	}
}