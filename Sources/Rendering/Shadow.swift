
public struct Shadow {

	public static let color = Color(white:0.0, alpha:0.6)

	// MARK: -

	public var alpha:Points
	public var color:Color
	public var offset:Offset
	public var radius:Points

	// MARK: -

	public init(alpha:Points = 0.0, color:Color = color, offset:Offset = .zero, radius:Points = 3.0) {
		(self.alpha, self.color, self.offset, self.radius) = (alpha, color, offset, radius)
	}
}
