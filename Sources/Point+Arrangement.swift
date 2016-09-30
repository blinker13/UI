
import Geometry

extension Point : ArrangementCreatable {
	public init(values:[Arrangement:Real]) {
		self.x = values[.horizontal] ?? 0
		self.y = values[.vertical] ?? 0
	}
}

extension Point : ArrangementRepresentable {
	public var horizontal:Real { return x }
	public var vertical:Real { return y }
}
