
public struct Line : Shape {

	public var from:Point
	public var to:Point

	public init (from:Point, to:Point) {
		(self.from, self.to) = (from, to)
	}
}

public extension Line {

	var bounds:Rect {
		return Rect(points:[from, to])
	}

	var path:Path {
		return Path(
			.move(to:from),
			.line(to:to)
		)
	}

	var length:Float {
		return from.distance(to:to)
	}

	func contains(_ point:Point) -> Bool {
		// TODO: implementation
		return false
	}
}

extension Line : Equatable {
	public static func == (left:Line, right:Line) -> Bool {
		return left.from == right.from && left.to == right.to
	}
}

extension Line : Transformable {
	public func transformed(by transform:Transform) -> Line {
		let a = from.transformed(by:transform)
		let b = to.transformed(by:transform)
		return Line(from:a, to:b)
	}
}
