
extension Point : ArrangementCreatable {
	public init (values:[Arrangement:Float]) {
		self.x = values[.horizontal] ?? 0
		self.y = values[.vertical] ?? 0
	}
}

extension Point : ArrangementRepresentable {
	public var horizontal:Float { return x }
	public var vertical:Float { return y }
}
