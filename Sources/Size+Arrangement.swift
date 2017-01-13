
import Geometry

extension Size : ArrangementCreatable {
	public init (values:[Arrangement:Float]) {
		self.width = values[.horizontal] ?? 0
		self.height = values[.vertical] ?? 0
	}
}

extension Size : ArrangementRepresentable {
	public var horizontal:Float { return width }
	public var vertical:Float { return height }
}
