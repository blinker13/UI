
public struct Border : Equatable {

	public let color:Color
	public let radius:Unit
	public let width:Unit

	// MARK: -

	public init(color:Color = Color.black, radius:Unit = 0, width:Unit = 0) {
		(self.color, self.radius, self.width) = (color, radius, width)
	}
}

// MARK: -

public func == (left:Border, right:Border) -> Bool {
	return left.color == right.color && left.radius == right.radius && left.width == right.width
}
