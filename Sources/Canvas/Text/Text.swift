
public struct Text {

	public enum Alignment {
		case leading
		case center
		case trailing
		case justified
		case natural
	}

	public enum Style {
		case none
		case single
		case thick
		case double
		case solid
		case dot
		case dash
		case dashDot
		case dashDotDot
		case byWord
	}

	public enum Truncation {
		case head
		case middle
		case tail
	}

	public struct Attributes {

		let font: Font?
		let foreground: Color?
		let background: Color?
		let ligatures: Bool?
		let kern: Float?
		let strikethrough: Style?
		let underline: Style?
		let strokeColor: Color?
		let strokeWidth: Float?

		internal init(
			font: Font? = nil,
			foreground: Color? = nil,
			background: Color? = nil,
			ligatures: Bool? = nil,
			kern: Float? = nil,
			strikethrough: Style? = nil,
			underline: Style? = nil,
			strokeColor: Color? = nil,
			strokeWidth: Float? = nil
		) {
			self.font = font
			self.foreground = foreground
			self.background = background
			self.ligatures = ligatures
			self.kern = kern
			self.strikethrough = strikethrough
			self.underline = underline
			self.strokeColor = strokeColor
			self.strokeWidth = strokeWidth
		}
	}

	public struct Range {
		public let location: Int
		public let length: Int
	}

	public struct Run {
		public let attributes: Attributes
		public let range: Range
	}

	public let string: String
	public let runs: [Run]

	internal init(_ string: String, _ runs: [Run]) {
		(self.string, self.runs) = (string, runs)
	}
}

// MARK: -

public extension Text {

	subscript (location: Int) -> (Attributes, Range)? {
		guard let run: Run = self[location] else { return nil }
		return (run.attributes, run.range)
	}

	subscript (location: Int) -> Attributes {
		return self[location]?.attributes ?? Attributes()
	}
}

// MARK: -

internal extension Text {
	subscript (location: Int) -> Run? {
		return runs.first { $0.range.contains(location) }
	}
}
