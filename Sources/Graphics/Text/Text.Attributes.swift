
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

		public let color:Color?
		public let style:Style
		public let pattern:Pattern
		public let byWord:Bool

		public init (color:Color? = nil, style:Style = .single, pattern:Pattern = .solid, byWord:Bool = true) {
			(self.color, self.style, self.pattern, self.byWord) = (color, style, pattern, byWord)
		}
	}

	public enum Direction {
		case leftToRight
		case rightToLeft
		case natural
	}

	public struct Stroke {

		public let color:Color
		public let width:Float

		public init (color:Color, width:Float) {
			(self.color, self.width) = (color, width)
		}
	}
}
