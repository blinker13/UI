
public struct Border {

	public var color:Color
	public var radius:Unit
	public var width:Unit

	// MARK: -

	public init(color:Color = Color.black, radius:Unit = 0.0, width:Unit = 0.0) {
		(self.color, self.radius, self.width) = (color, radius, width)
	}
}
