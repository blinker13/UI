
public struct Line : Equatable, Shape {
	public var start:Point
	public var end:Point
}

// MARK: -

public extension Line {

	var boundingBox:Rectangle {
		return Rectangle(points:[start, end])
	}

	var elements:[Path.Element] {
		return [
			.MoveTo(start),
			.LineTo(end)
		]
	}

	func contains(point:Point) -> Bool {
		// TODO: implementation
		return false
	}
}

// MARK: -

extension Line : Transformable {
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
