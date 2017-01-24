
import CoreGraphics

internal extension CGPoint {
	init (with point:Point) {
		self.x = CGFloat(point.x)
		self.y = CGFloat(point.y)
	}
}

internal extension CGSize {

	init (with size:Size) {
		self.height = CGFloat(size.height)
		self.width = CGFloat(size.width)
	}
}

internal extension CGRect {

	init (with rect:Rect) {
		self.origin = CGPoint(with:rect.origin)
		self.size = CGSize(with:rect.size)
	}
}
