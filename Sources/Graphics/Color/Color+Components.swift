
public extension Color.Components {

	public typealias Value = Float

	init (_ hex:Int) {
		let r = Value(hex >> 16 & 0xFF)
		let g = Value(hex >> 8 & 0xFF)
		let b = Value(hex & 0xFF)
		self = .rgb(r, g, b)
	}

	// TODO: complementary components

	var inverted:Color.Components {
		switch self {
			case let .rgb(r, g, b): return .rgb(1.0 - r, 1.0 - g, 1.0 - b)
			case let .gray(x): return .gray(1.0 - x)
		}
	}
}

extension Color.Components : Codable {

	public enum Keys : String, CodingKey {
		case rgb
		case gray
	}

	public init (from decoder:Decoder) throws {
		let container = try decoder.container(keyedBy:Keys.self)

		switch container.allKeys.first! {
			case .rgb: let v = try container.decode([Value].self, forKey:.rgb); self = .rgb(v[0], v[1], v[2])
			case .gray: let x = try container.decode(Value.self, forKey:.gray); self = .gray(x)
		}
	}

	public func encode(to encoder:Encoder) throws {
		var container = encoder.container(keyedBy:Keys.self)

		switch (self) {
			case let .rgb(r, g, b): try container.encode([r, g, b], forKey:.rgb)
			case let .gray(x): try container.encode(x, forKey:.gray)
		}
	}
}

extension Color.Components : CustomStringConvertible {
	public var description:String {
		switch self {
			case let .rgb(r, g, b): return "red:\(r), green:\(g), blue:\(b)"
			case let .gray(x): return "gray:\(x)"
		}
	}
}
