
import CoreGraphics
import Geometry

internal extension CGPoint {
	init (with point:Point) {
		let x = CGFloat(point.x)
		let y = CGFloat(point.y)
		self.init(x:x, y:y)
	}
}

internal extension CGSize {

	init (with size:Size) {
		let width = CGFloat(size.width)
		let height = CGFloat(size.height)
		self.init(width:width, height:height)
	}
}

internal extension CGRect {

	init (with rect:Rect) {
		let size = CGSize(with:rect.size)
		let origin = CGPoint(with:rect.origin)
		self.init(origin:origin, size:size)
	}
}

internal extension CGAffineTransform {

	init (with transform:Transform) {
		self.init(
			a:CGFloat(transform.a),
			b:CGFloat(transform.b),
			c:CGFloat(transform.c),
			d:CGFloat(transform.d),
			tx:CGFloat(transform.x),
			ty:CGFloat(transform.y)
		)
	}
}
