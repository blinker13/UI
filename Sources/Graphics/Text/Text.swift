
public struct Text : Sequence, Equatable {

	public typealias Iterator = IndexingIterator<[Text.Run]>
	public typealias Style = Set<Attribute>

	public struct Attribute : Hashable {
		public typealias Value = Codable
		private let value:Value
		private let key:String
	}

	public struct Run : Equatable {
		public let string:String
		public let style:Style
	}

	internal let runs:[Run]
}

public extension Text {

	static func == (left:Text, right:Text) -> Bool {
		return left.runs == right.runs
	}

	init (_ string:String, with style:Style) {
		let run = Run(string:string, style:style)
		self.runs = [run]
	}

	init (_ string:String, _ attributes:Attribute ...) {
		let style = Style(attributes)
		self.init(string, with:style)
	}

//	init (style:Style = [], separator:String = " ", _ texts:Text ...) {
//
//		let runs = texts.map { text in
//			let style = text.runs.
//		}
//
//
//		self.kind = .compound(runs)
//		self.string = separator
//		self.style = style
//	}

	func makeIterator() -> Iterator {
		return runs.makeIterator()
	}
}

// MARK: -

public extension Text.Attribute {

	static func == (left:Text.Attribute, right:Text.Attribute) -> Bool {
		guard left.key == right.key else { return false }
		return true //TODO: check .value -> compare encoding ???
	}

	var hashValue:Int { return key.hashValue }
}

// MARK: -

public extension Text.Run {
	static func == (left:Text.Run, right:Text.Run) -> Bool {
		return left.string == right.string && left.style == right.style
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
//		switch self {
//		case let .rgb(r, g, b): try container.encode([r, g, b], forKey:.rgb)
//		case let .gray(x): try container.encode(x, forKey:.gray)
//		}
//	}
//}

//extension Text : CustomStringConvertible {
//
//	public var description:String {
//		switch self {
//			case let .compound(compound): return compound.description
//			case let .run(run): return run.description
//		}
//	}
//}

//extension Text : Drawable {
//	public func draw(in rect:Rect) -> Composition {
//		return .print(self)
//	}
//}

//extension Text : ExpressibleByStringLiteral {
//	public init (unicodeScalarLiteral value:StringLiteralType) { self.init(stringLiteral:"\(value)") }
//	public init (extendedGraphemeClusterLiteral value:String) { self.init(stringLiteral:value) }
//	public init (stringLiteral value:String) { self.init(value) }
//}

//extension Text : Stylable {
//	public var style:Style {
//		switch self {
//			case let .compound(compound): return compound.style
//			case let .run(run): return run.style
//		}
//	}
//}

