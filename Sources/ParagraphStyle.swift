
public struct ParagraphStyle {

	public let alignment:Text.Alignment
	public let direction:Text.Direction
	public let lineBreak:LineBreak
//	public let firstLineHeadIndent:Float

	public init (
		alignment:Text.Alignment = .left,
		direction:Text.Direction = .natural,
		lineBreak:LineBreak = .truncateTail
	) {
		self.alignment = alignment
		self.direction = direction
		self.lineBreak = lineBreak
	}
}
