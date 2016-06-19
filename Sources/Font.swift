
public struct Font {

	public enum Style {
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

	public let name:String
	public let size:Unit
	public let style:Style
	public let weight:Weight

	public init(name:String, size:Unit, style:Style = .normal, weight:Weight = .regular) {
		(self.name, self.size, self.style, self.weight) = (name, size, style, weight)
	}
}

// MARK: -

extension Font : CustomStringConvertible {
	public var description:String {
		return "Font(\"\(name)-\(style)-\(weight)\" \(size))"
	}
}

// MARK: -

extension Font : Hashable {
	public var hashValue:Int {
		return description.hashValue
	}
}

// MARK: -

public func == (left:Font, right:Font) -> Bool {
	return left.name == right.name && left.size == right.size && left.style == right.style && left.weight == right.weight
}
