
public struct Text {

	public enum Alignment {
		case left
		case center
		case right
		case justified
		case natural
	}

	public enum Direction {
		case leftToRight
		case rightToLeft
		case natural
	}

	public struct Attributes {

		let font:Font?
		let foreground:Color?
		let background:Color?
//		let paragraphStyle:ParagraphStyle?
		let strikethrough:Decoration?
		let underline:Decoration?
		let ligatures:Bool?
		let shadow:Shadow?
		let stroke:Stroke?
		let kern:Float?

		internal init (
			font:Font? = nil,
			foreground:Color? = nil,
			background:Color? = nil,
//			paragraphStyle:ParagraphStyle? = nil,
			strikethrough:Decoration? = nil,
			underline:Decoration? = nil,
			ligatures:Bool? = nil,
			shadow:Shadow? = nil,
			stroke:Stroke? = nil,
			kern:Float? = nil
		) {
			self.font = font
			self.foreground = foreground
			self.background = background
//			self.paragraphStyle = paragraphStyle
			self.strikethrough = strikethrough
			self.underline = underline
			self.ligatures = ligatures
			self.shadow = shadow
			self.stroke = stroke
			self.kern = kern
		}
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

	public struct Range {
		public let location:Int
		public let length:Int
	}

	public struct Run {
		public let attributes:Attributes
		public let range:Range
	}

	public struct Stroke {
		public let color:Color
		public let width:Float
	}

	public let string:String
	public let runs:[Run]

	internal init (_ string:String, _ runs:[Run]) {
		(self.string, self.runs) = (string, runs)
	}
}

public extension Text {

	subscript (location:Int) -> (Attributes, Range)? {
		guard let run:Run = self[location] else { return nil }
		return (run.attributes, run.range)
	}

	subscript (location:Int) -> Attributes {
		return self[location]?.attributes ?? Attributes()
	}
}

internal extension Text {
	subscript (location:Int) -> Run? {
		return runs.first { $0.range.contains(location) }
	}
}
