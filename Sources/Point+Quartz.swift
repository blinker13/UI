
import CoreGraphics

public extension Point {

	var quartz:CGPoint {
		let x = CGFloat(self.x)
		let y = CGFloat(self.y)
		return CGPoint(x:x, y:y)
	}

	init (quartz point:CGPoint) {
		self.x = Float(point.x)
		self.y = Float(point.y)
	}
}
