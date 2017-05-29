
public extension Text {

	public struct Stroke {

		public let color:Color
		public let width:Float

		public init (color:Color, width:Float) {
			(self.color, self.width) = (color, width)
		}
	}
}
