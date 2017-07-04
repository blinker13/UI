
public extension Color {

	static let clear	= Color(white:0, alpha:0)
	
	static let black	= Color(white:0)
	static let gray		= Color(white:0.5)
	static let white	= Color(white:1)

	// TODO: grayscale

	init (white:Float, alpha:Alpha = 1) {
		self.components = .gray(white.clamped())
		self.alpha = alpha.clamped()
	}
}
