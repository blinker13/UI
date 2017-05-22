
public extension Text {

	public enum Alignment {
		case left
		case center
		case right
		case justified
		case natural
	}

	public struct Decoration {

		public enum Style {
			case single
			case thick
			case double
		}

		public enum Pattern {
			case solid
			case dot
			case dash
			case dashDot
			case dashDotDot
		}

		public let color:Color
		public let style:Style
		public let pattern:Pattern
		public let byWord:Bool
	}

	public enum Direction {
		case leftToRight
		case rightToLeft
		case natural
	}

	public struct Stroke {
		public let color:Color
		public let width:Float
	}

	// MARK: -

	static let font = Attribute<Font>("text.font")
	static let tint = Attribute<Color>("text.tint")
	static let background = Attribute<Color>("text.background")
	static let paragraphStyle = Attribute<ParagraphStyle>("text.paragraphStyle")
	static let strikethrough = Attribute<Decoration>("text.strikethrough")
	static let underline = Attribute<Decoration>("text.underline")
	static let ligatures = Attribute<Bool>("text.ligatures")
	static let shadow = Attribute<Shadow>("text.shadow")
	static let stroke = Attribute<Stroke>("text.stroke")
	static let kern = Attribute<Float>("text.kern")

	// MARK: -

	static func font(_ font:Font) -> Style {
		return self.font.styled(font)
	}

	static func tint(_ color:Color) -> Style {
		return Text.tint.styled(color)
	}

	static func background(_ color:Color) -> Style {
		return Text.background.styled(color)
	}

	static func paragraphStyle(_ style:ParagraphStyle) -> Style {
		return Text.paragraphStyle.styled(style)
	}

	static func strikethrough(_ decoration:Decoration) -> Style {
		return Text.strikethrough.styled(decoration)
	}

	static func underline(_ underline:Decoration) -> Style {
		return Text.underline.styled(underline)
	}

	static func ligatures(_ ligatures:Bool) -> Style {
		return Text.ligatures.styled(ligatures)
	}

	static func shadow(_ shadow:Shadow) -> Style {
		return Text.shadow.styled(shadow)
	}

	static func stroke(_ stroke:Stroke) -> Style {
		return Text.stroke.styled(stroke)
	}

	static func kern(_ kern:Float) -> Style {
		return Text.kern.styled(kern)
	}
}
