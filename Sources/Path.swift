
public struct Path : Equatable, Shape {

    public enum Element {
		case moveTo(Point)
		case lineTo(Point)
		case cubicCurveTo(Point, Point, Point)
		case quadCurveTo(Point, Point)
		case close
    }

	public let elements:[Element]
}

// MARK: -

public extension Path {

	var boundingBox:Rectangle {
		return Rectangle.zero
	}

	func contains(_ point:Point) -> Bool {
		// TODO: implementation
		return false
	}

	public init(_ elements:Element ...) {
		self.init(elements:elements)
	}
}

// MARK: -

extension Path : Transformable {
	public func transformed(_ transform:Transform) -> Path {
		// TODO: implementation
		return self
	}
}

// MARK: -

public func == (left:Path, right:Path) -> Bool {
	// TODO: implementation
	return false
}
