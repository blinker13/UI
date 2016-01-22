
public protocol TextType : CustomStringConvertible {
	subscript(index:String.Index) -> Glyph { get }
	var content:String { get }
}

// MARK: -

extension TextType {
	public var description:String {
		return content
	}
}
