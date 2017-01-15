
public struct Font {

	public typealias Name = String
	public typealias Size = Float

	public enum Style : String {
		case normal
		case italic
		case oblique
	}

	public enum Weight {
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

	public let name:Name
	public let size:Size
	public let style:Style
	public let weight:Weight

	public init (name:Name, size:Size, style:Style = .normal, weight:Weight = .regular) {
		(self.name, self.size, self.style, self.weight) = (name, size, style, weight)
	}
}

public extension Font {
	static var `default`:Font {
		return Font(name:"Helvetica", size:12)
	}
}

extension Font : CustomStringConvertible {
	public var description:String {
		return "\(name) \(weight) \(style) - \(size)"
	}
}

extension Font : Hashable {

	public static func == (left:Font, right:Font) -> Bool {
		return left.name == right.name && left.size == right.size && left.style == right.style && left.weight == right.weight
	}

	public var hashValue:Int {
		return description.hashValue
	}
}

