
public struct Path : Shape {

	public enum Element {
		case move(to:Point)
		case line(to:Point)
		case cubicCurve(to:Point, Point, Point)
		case quadCurve(to:Point, Point)
		case close
	}

	public let elements:[Element]

	public init (with elements:[Element]) {
		self.elements = elements
	}
}

public extension Path {

	var bounds:Rect {
		return Rect.zero
	}

	var path:Path {
		return self
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

extension Path.Element : Equatable {
	public static func == (left:Path.Element, right:Path.Element) -> Bool {
		switch (left, right) {
			case let (.move(to:lp), .move(to:rp)): return lp == rp
			case let (.line(to:lp), .line(to:rp)): return lp == rp
			case let (.cubicCurve(to:lp0, lp1, lp2), .cubicCurve(to:rp0, rp1, rp2)): return lp0 == rp0 && lp1 == rp1 && lp2 == rp2
			case let (.quadCurve(lp0, lp1), .quadCurve(rp0, rp1)): return lp0 == rp0 && lp1 == rp1
			case (.close, .close): return true
			default: return false
		}
	}
}

extension Path : Transformable {
	public func transformed(by transform:Transform) -> Path {
		// TODO: implementation
		return self
	}
}
