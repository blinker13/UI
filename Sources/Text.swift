
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

//extension Text : Codable {
//
//	public enum Keys : String, CodingKey {
//		case compound
//		case run
//	}
//
//	public init (from decoder:Decoder) throws {
//		let container = try decoder.container(keyedBy:Keys.self)
//
//		switch container.allKeys.first! {
//		case .rgb: let v = try container.decode([Value].self, forKey:.rgb); self = .rgb(v[0], v[1], v[2])
//		case .gray: let x = try container.decode(Value.self, forKey:.gray); self = .gray(x)
//		}
//	}
//
//	public func encode(to encoder:Encoder) throws {
//		var container = encoder.container(keyedBy:Keys.self)
//
//		switch (self) {
//		case let .rgb(r, g, b): try container.encode([r, g, b], forKey:.rgb)
//		case let .gray(x): try container.encode(x, forKey:.gray)
//		}
//	}
//}

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
