
public struct Font : Hashable {

	public typealias Name = String
	public typealias Size = Double

	public enum Style : Hashable {
		case normal
		case italic
		case oblique
	}

	public enum Weight : Hashable {
		case ultraLight
		case thin
		case light
		case regular
		case medium
		case semibold
		case bold
		case heavy
		case black
	}

	public let name: Name
	public let size: Size
	public let style: Style
	public let weight: Weight
}
