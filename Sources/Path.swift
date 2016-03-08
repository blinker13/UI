
public struct Path : Equatable, Shape {

    public enum Element {
		case MoveTo(Point)
		case LineTo(Point)
		case CubicCurveTo(Point, Point, Point)
		case QuadCurveTo(Point, Point)
		case Close
    }

	public var boundingBox:Rectangle {
		return Rectangle.zero
	}

	public let elements:[Element]

    // MARK: -

    public init(elements:[Element]) {
        self.elements = elements
    }

	public init(shapes:[Shape]) {
		self.init(elements:shapes.flatMap {
			$0.elements
		})
	}

	// MARK: -

	public func contains(point:Point) -> Bool {
		return false // TODO: implementation
	}

	public func transformed(transform:Transform) -> Path {
		return self // TODO: implementation
	}
}

// MARK: -

public func == (left:Path, right:Path) -> Bool {
	return false // TODO: implementation
}
