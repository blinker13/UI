
public protocol TextType : CollectionType, StringLiteralConvertible {
	var content:String { get }
	init(content:String)
}

// MARK: - CollectionType

extension TextType {
	public var startIndex:String.Index {
		return content.startIndex
	}

	public var endIndex:String.Index {
		return content.endIndex
	}
}

// MARK: - StringLiteralConvertible

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
}
