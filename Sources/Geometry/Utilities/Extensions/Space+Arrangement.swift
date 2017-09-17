
extension Space : ArrangementRepresentable {
	public var horizontal:Axis { return Axis(start:left, end:right) }
	public var vertical:Axis { return Axis(start:top, end:bottom) }
}
