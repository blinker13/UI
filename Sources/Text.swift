
public struct Text : Equatable {

	public static let color = Color.black
	public static let font = Font(name:"Arial", size:13.0)

	// MARK: -

	public let content:String
	public let color:Color
	public let font:Font

	// MARK: -

	public init(content:String, color:Color = Text.color, font:Font = Text.font) {
		(self.content, self.color, self.font) = (content, color, font)
	}
}

// MARK: - StringLiteralConvertible

extension Text : StringLiteralConvertible {
	public init(unicodeScalarLiteral value:StringLiteralType) { self.init(stringLiteral:"\(value)") }
	public init(extendedGraphemeClusterLiteral value:String) { self.init(stringLiteral:value) }
	public init(stringLiteral value:String) { self.init(content:value) }
}

// MARK: - CustomStringConvertible

extension Text : CustomStringConvertible {
	public var description:String {
		return content
	}
}

// MARK: -

public func == (left:Text, right:Text) -> Bool {
	return left.content == right.content && left.color == right.color && left.font == right.font
}
