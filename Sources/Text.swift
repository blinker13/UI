
public enum Text {

	public struct Run {
		internal let string:String
		internal let style:Style
	}

	public struct Compound {
		internal let separator:String
		internal let style:Style
		internal let runs:[Text]
	}

	case compound(Compound)
	case run(Run)
}

public extension Text {

	init (_ string:String, style:Style) {
		let run = Run(string:string, style:style)
		self = .run(run)
	}

	init (_ string:String, styles:Style ...) {
		let style = Style(with:styles)
		self.init(string, style:style)
	}

	init (style:Style = Style(), separator:String = " ", _ runs:Text ...) {
		let compound = Compound(separator:separator, style:style, runs:runs)
		self = .compound(compound)
	}
}

extension Text : CustomStringConvertible {

	public var description:String {
		switch self {
			case let .compound(compound): return compound.description
			case let .run(run): return run.description
		}
	}
}

extension Text : Equatable {

	public static func == (left:Text, right:Text) -> Bool {
		switch (left, right) {
			case let (.compound(lefty), .compound(righty)): return lefty == righty
			case let (.run(lefty), .run(righty)): return lefty == righty
			default: return false
		}
	}
}

extension Text : ExpressibleByStringLiteral {
	public init (unicodeScalarLiteral value:StringLiteralType) { self.init(stringLiteral:"\(value)") }
	public init (extendedGraphemeClusterLiteral value:String) { self.init(stringLiteral:value) }
	public init (stringLiteral value:String) { self.init(value) }
}

extension Text : Sequence {
	public func makeIterator() -> Text.Iterator {
		return Iterator(with:self)
	}
}
