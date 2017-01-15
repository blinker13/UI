
import CoreGraphics

public extension Size {

	var quartz:CGSize {
		let w = CGFloat(self.width)
		let h = CGFloat(self.height)
		return CGSize(width:w, height:h)
	}

	init (quartz size:CGSize) {
		self.width = Float(size.width)
		self.height = Float(size.height)
	}
}
