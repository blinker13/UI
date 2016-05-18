
public struct Line : Shape {

	public var start:Point
	public var end:Point

	// MARK: -

	public init(start:Point = .zero, end:Point = .zero) {
		(self.start, self.end) = (start, end)
	}
}

// MARK: -

extension Line {

	public var boundingBox:Rectangle {
		return Rectangle(points:[start, end])
	}

	public var elements:[Path.Element] {
		return [ .MoveTo(start), .LineTo(end) ]
	}

	public func contains(point:Point) -> Bool {
		return false // TODO: implementation
	}

	public func transformed(transform:Transform) -> Line {
		let newStart = start.transformed(transform)
		let newEnd = end.transformed(transform)
		return Line(start:newStart, end:newEnd)
	}
}

// MARK: -

public func == (left:Line, right:Line) -> Bool {
	return left.start == right.start && left.end == right.end
}
