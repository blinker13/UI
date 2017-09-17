
public struct Border : Codable {

	public let color:Color
	public let radius:Float
	public let width:Float

	public init (color:Color = .black, radius:Float = 0, width:Float = 0) {
		(self.color, self.radius, self.width) = (color, radius, width)
	}
}

extension Border : Equatable {
	public static func == (left:Border, right:Border) -> Bool {
		return left.color == right.color && left.radius == right.radius && left.width == right.width
	}
}
