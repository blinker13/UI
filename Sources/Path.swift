
public struct Path : Equatable, Shape {

    public enum Element {
		case MoveTo(Point)
		case LineTo(Point)
		case CubicCurveTo(Point, Point, Point)
		case QuadCurveTo(Point, Point)
		case Close
    }

	public let elements:[Element]
}

// MARK: -

public extension Path {

	var boundingBox:Rectangle {
		return Rectangle.zero
	}

	func contains(point:Point) -> Bool {
		// TODO: implementation
		return false
	}

	public init(_ elements:Element ...) {
		self.init(elements:elements)
	}
}

// MARK: -

extension Path : Transformable {
	public func transformed(transform:Transform) -> Path {
		// TODO: implementation
		return self
	}
}

// MARK: -

public func == (left:Path, right:Path) -> Bool {
	// TODO: implementation
	return false
}
