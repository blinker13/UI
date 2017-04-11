
import CoreGraphics

internal extension Point {

	init (cg point:CGPoint) {
		self.x = Float(point.x)
		self.y = Float(point.y)
	}
}

internal extension Size {

	init (cg size:CGSize) {
		self.height = Float(size.height)
		self.width = Float(size.width)
	}
}

internal extension Rect {

	init (cg rect:CGRect) {
		self.origin = Point(cg:rect.origin)
		self.size = Size(cg:rect.size)
	}
}
