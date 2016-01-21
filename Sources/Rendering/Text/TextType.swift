
public protocol TextType {
	subscript(index:String.Index) -> Glyph { get }
	var content:String { get }
	init(content:String)
}
