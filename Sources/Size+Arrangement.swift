
import Geometry

extension Size : ArrangementCreatable {
	public init(values:[Arrangement:Real]) {
		self.width = values[.horizontal] ?? 0
		self.height = values[.vertical] ?? 0
	}
}

extension Size : ArrangementRepresentable {
	public var horizontal:Real { return width }
	public var vertical:Real { return height }
}
