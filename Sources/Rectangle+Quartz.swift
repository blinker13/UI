
import CoreGraphics

public extension Rect {

	var quartz:CGRect {
		return CGRect(origin:origin.quartz, size:size.quartz)
	}

	init (quartz rect:CGRect) {
		self.origin = Point(quartz:rect.origin)
		self.size = Size(quartz:rect.size)
	}
}
