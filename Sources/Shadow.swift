
public struct Shadow : Codable {

	public let color:Color
	public let offset:Point
	public let opacity:Opacity
	public let radius:Float

	public init (color:Color = .black, offset:Point = .zero, opacity:Opacity = 0.6, radius:Float = 3) {
		(self.color, self.offset, self.opacity, self.radius) = (color, offset, opacity, radius)
	}
}

extension Shadow : Equatable {
	public static func == (left:Shadow, right:Shadow) -> Bool {
		return left.color == right.color && left.offset == right.offset && left.opacity == right.opacity && left.radius == right.radius
	}
}
