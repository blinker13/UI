
public extension Color {

	init (hex:Int, alpha:Alpha = 1.0) {
		self.components = Components(hex)
		self.alpha = alpha
	}
}

extension Color : ExpressibleByIntegerLiteral {
	public init (integerLiteral value:Int) {
		self.init(hex:value)
	}
}
