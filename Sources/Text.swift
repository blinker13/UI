
public struct Text {

	public struct Range {
		public let location:Int
		public let length:Int
	}

	public struct Run {
		public let range:Range
		public let style:Style
	}
	
	public let string:String
	public let runs:[Run]
}

public extension Text {

	init (_ string:String, runs:[Run]) {
		self.string = string
		self.runs = runs
	}

	init (_ string:String, style:Style) {
		let range = Range(from:string)
		let run = Run(range:range, style:style)
		self.init(string, runs:[run])
	}

	init (_ string:String, _ styles:Style ...) {
		let style = Style(with:styles)
		self.init(string, style:style)
	}

	subscript (location:Int) -> Run? {
		return runs.first { $0.range.contains(location) }
	}

	subscript (location:Int) -> Style {
		let run:Run? = self[location]
		return run?.style ?? Style()
	}
}

// MARK: -

extension Text : CustomStringConvertible {
	public var description:String {
		return string
	}
}

extension Text : Equatable {
	public static func == (left:Text, right:Text) -> Bool {
		return left.string == right.string
	}
}

extension Text : ExpressibleByStringLiteral {
	public init (unicodeScalarLiteral value:StringLiteralType) { self.init(stringLiteral:"\(value)") }
	public init (extendedGraphemeClusterLiteral value:String) { self.init(stringLiteral:value) }
	public init (stringLiteral value:String) { self.init(value) }
}

// MARK: -

private extension Text {

	init (_ string:String, _ values:Set<Style.Value>) {
		let style = Style(values:values)
		self.init(string, style:style)
	}
}
