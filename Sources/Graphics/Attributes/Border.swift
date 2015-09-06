
public struct Border : Codable, Hashable {

	public typealias Radius = Float
	public typealias Width = Float

	public let color:Color
	public let radius:Radius
	public let width:Width

	public init (color:Color = .black, radius:Radius = 0, width:Width = 0) {
		(self.color, self.radius, self.width) = (color, radius, width)
	}
}
