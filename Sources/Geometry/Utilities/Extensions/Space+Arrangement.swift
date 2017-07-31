
extension Space : ArrangementRepresentable {
	public var horizontal:Edges { return Edges(leading:left, trailing:right) }
	public var vertical:Edges { return Edges(leading:top, trailing:bottom) }
}
