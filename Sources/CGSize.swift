
import CoreGraphics
import Geometry

internal extension CGSize {

	init (with size:Size) {
		self.height = CGFloat(size.height)
		self.width = CGFloat(size.width)
	}
}
