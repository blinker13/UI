
public struct Path : Shape {

	public enum Element : Hashable {
		case move(to:Point)
		case line(to:Point)
		case cubicCurve(to:Point, Point, Point)
		case quadCurve(to:Point, Point)
		case close
	}

	public let elements:[Element]
}

public extension Path {

	var bounds:Rect {
		return Rect.zero
	}

	var path:Path {
		return self
	}

	public init (with elements:[Element]) {
		self.elements = elements
	}

	public init (_ elements:Element ...) {
		self.init(with:elements)
	}

	func contains(_ point:Point) -> Bool {
		// TODO: implementation
		return false
	}
}

public extension Path.Element {

	static func moveTo(x:Float, y:Float) -> Path.Element {
		return .move(to:Point(x, y))
	}

	static func lineTo(x:Float, y:Float) -> Path.Element {
		return .line(to:Point(x, y))
	}
}

extension Path : Equatable {
	public static func == (left:Path, right:Path) -> Bool {
		return left.elements == right.elements
	}
}

extension Path.Element : Codable {

	public enum Keys : String, CodingKey {
		case move
		case line
		case cubicCurve
		case quadCurve
		case close
	}

	public init (from decoder:Decoder) throws {
		let container = try decoder.container(keyedBy:Keys.self)

		switch container.allKeys.first! {
			case .move: let point = try container.decode(Point.self, forKey:.move); self = .move(to:point)
			case .line: let point = try container.decode(Point.self, forKey:.line); self = .line(to:point)
			case .cubicCurve: let p = try container.decode([Point].self, forKey:.cubicCurve); self = .cubicCurve(to:p[0], p[1], p[2])
			case .quadCurve: let p = try container.decode([Point].self, forKey:.quadCurve); self = .quadCurve(to:p[0], p[1])
			case .close: self = .close
		}
	}

	public func encode(to encoder:Encoder) throws {
		var container = encoder.container(keyedBy:Keys.self)

		switch (self) {
			case let .move(to:point): try container.encode(point, forKey:.move)
			case let .line(to:point): try container.encode(point, forKey:.line)
			case let .cubicCurve(to:p0, p1, p2): try container.encode([p0, p1, p2], forKey:.cubicCurve)
			case let .quadCurve(p0, p1): try container.encode([p0, p1], forKey:.quadCurve)
			case .close: try container.encode(true, forKey:.close)
		}
	}
}

//extension Path.Element : Equatable {
//	public static func == (left:Path.Element, right:Path.Element) -> Bool {
//		switch (left, right) {
//			case let (.move(to:lp), .move(to:rp)): return lp == rp
//			case let (.line(to:lp), .line(to:rp)): return lp == rp
//			case let (.cubicCurve(to:lp0, lp1, lp2), .cubicCurve(to:rp0, rp1, rp2)): return lp0 == rp0 && lp1 == rp1 && lp2 == rp2
//			case let (.quadCurve(lp0, lp1), .quadCurve(rp0, rp1)): return lp0 == rp0 && lp1 == rp1
//			case (.close, .close): return true
//			default: return false
//		}
//	}
//}

extension Path : Transformable {
	public func transformed(by transform:Transform) -> Path {
		// TODO: implementation
		return self
	}
}
