
public struct Shadow : Equatable {

	public static let color = Color(white:0.0, alpha:0.6)

	// MARK: -

	public var color:Color
	public var offset:Offset
	public var opacity:Unit
	public var radius:Unit

	// MARK: -

	public init(color:Color = color, offset:Offset = .zero, opacity:Unit = 0.0, radius:Unit = 3.0) {
		(self.color, self.offset, self.opacity, self.radius) = (color, offset, opacity, radius)
	}
}

// MARK: -

public func == (left:Shadow, right:Shadow) -> Bool {
	return (left.color == right.color && left.offset == right.offset && left.opacity == right.opacity && left.radius == right.radius)
}
