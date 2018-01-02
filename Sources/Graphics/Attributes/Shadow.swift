
import Geometry

public struct Shadow : Codable, Hashable {

	public typealias Offset = Point
	public typealias Radius = Float

	public let color:Color
	public let offset:Offset
	public let opacity:Opacity
	public let radius:Float

	public init (color:Color = .black, offset:Offset = .zero, opacity:Opacity = 0.6, radius:Radius = 3) {
		(self.color, self.offset, self.opacity, self.radius) = (color, offset, opacity, radius)
	}
}
