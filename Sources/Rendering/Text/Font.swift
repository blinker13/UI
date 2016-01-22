
public struct Font : CustomStringConvertible, Hashable {

	public enum Style {
		case Normal
		case Italic
		case Oblique
	}

	public enum Weight {
		case UltraLight
		case Thin
		case Light
		case Regular
		case Medium
		case Semibold
		case Bold
		case Heavy
		case Black
	}

	// MARK: -

	public let name:String
	public let size:Unit
	public let style:Style
	public let weight:Weight

	// MARK: -

	public init(name:String, size:Unit, style:Style = .Normal, weight:Weight = .Regular) {
		(self.name, self.size, self.style, self.weight) = (name, size, style, weight)
	}

	// MARK: -

	public var description:String {
		return "Font(\"\(name)-\(style)-\(weight)\" \(size))"
	}

	public var hashValue:Int {
		return description.hashValue
	}
}

// MARK: -

public func == (left:Font, right:Font) -> Bool {
	return (left.name == right.name && left.size == right.size && left.style == right.style && left.weight == right.weight)
}
