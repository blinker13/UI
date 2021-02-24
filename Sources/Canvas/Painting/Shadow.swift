
import Geometry

public struct Shadow : Equatable {

	public let color: Color
	public let offset: Point
	public let radius: Scalar

	@inlinable public init(color: Color = .shadow, radius: Scalar = 3.0, offset: Point = .zero) {
		(self.color, self.offset, self.radius) = (color, offset, radius)
	}
}
