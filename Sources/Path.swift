
public protocol PathConvertible {
	var elements:[Path.Element] { get }
}

// MARK: -

public struct Path : Shape {

    public enum Element {
		case MoveTo(Point)
		case LineTo(Point)
		case CubicCurveTo(Point, Point, Point)
		case QuadCurveTo(Point, Point)
		case Close
    }

	public let elements:[Element]

    // MARK: -

    public init(elements:[Element]) {
        self.elements = elements
    }
}

// MARK: -

extension Path {

	public init(shapes:[PathConvertible]) {
		self.init(elements:shapes.flatMap {
			$0.elements
		})
	}

	public var boundingBox:Rectangle {
		return Rectangle.zero
	}

	public func contains(point:Point) -> Bool {
		return false // TODO: implementation
	}

	public func transformed(_ transform:Transform) -> Path {
		return self // TODO: implementation
	}
}

// MARK: -

public func == (left:Path, right:Path) -> Bool {
	return false // TODO: implementation
}
