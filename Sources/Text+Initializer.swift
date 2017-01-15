
public extension Text {

	init (_ string:String, attributes:Attributes) {
		let range = Range(from:string)
		let run = Run(attributes:attributes, range:range)
		self.init(string, [run])
	}

	init (_ string:String, color:Color = .black, font:Font = .default) {
		let attributes = Attributes(font:font, foreground:color)
		self.init(string, attributes:attributes)
	}
}

extension Text : ExpressibleByStringLiteral {
	public init (unicodeScalarLiteral value:StringLiteralType) { self.init(stringLiteral:"\(value)") }
	public init (extendedGraphemeClusterLiteral value:String) { self.init(stringLiteral:value) }
	public init (stringLiteral value:String) { self.init(value) }
}

public extension Text.Range {
	public init (from string:String) {
		self.length = string.characters.count
		self.location = 0
	}
}
