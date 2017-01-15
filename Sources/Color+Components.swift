
public extension Color.Components {

	init (_ hex:Int) {
		let r = Float(hex >> 16 & 0xFF)
		let g = Float(hex >> 8 & 0xFF)
		let b = Float(hex & 0xFF)
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

extension Color.Components : CustomStringConvertible {
	public var description:String {
		switch self {
			case let .rgb(r, g, b): return "red:\(r), green:\(g), blue:\(b)"
			case let .gray(x): return "gray:\(x)"
		}
	}
}

extension Color.Components : Hashable {

	public static func == (left:Color.Components, right:Color.Components) -> Bool {
		return left.hashValue == right.hashValue
	}

	public var hashValue:Int {
		switch self {
			case let .rgb(r, g, b): return hashify(r, g, b)
			case let .gray(x): return hashify(x, x, x)
		}
	}

	private func hashify(_ r:Float, _ g:Float, _ b:Float) -> Int {
		let x = Int(r * 255) << 16
		let y = Int(g * 255) << 8
		let z = Int(b * 255)
		return x + y + z
	}
}
