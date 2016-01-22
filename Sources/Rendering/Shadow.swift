
public struct Shadow {

	public static let color = Color(white:0.0, alpha:0.6)

	// MARK: -

	public var alpha:Unit
	public var color:Color
	public var offset:Offset
	public var radius:Unit

	// MARK: -

	public init(alpha:Unit = 0.0, color:Color = color, offset:Offset = .zero, radius:Unit = 3.0) {
		(self.alpha, self.color, self.offset, self.radius) = (alpha, color, offset, radius)
	}
}
