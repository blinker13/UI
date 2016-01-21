
public struct Border {

	public var color:Color
	public var radius:Points
	public var width:Points

	// MARK: -

	public init(color:Color = Color.black, radius:Points = 0.0, width:Points = 0.0) {
		(self.color, self.radius, self.width) = (color, radius, width)
	}
}
