
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

internal extension CGAffineTransform {

	init (with transform:Transform) {
		self.a = CGFloat(transform.a)
		self.b = CGFloat(transform.b)
		self.c = CGFloat(transform.c)
		self.d = CGFloat(transform.d)
		self.tx = CGFloat(transform.x)
		self.ty = CGFloat(transform.y)
	}
}

// MARK: -

internal extension Point {
	var cgPoint:CGPoint { return CGPoint(with:self) }
}

internal extension Size {
	var cgSize:CGSize { return CGSize(with:self) }
}

internal extension Rect {
	var cgRect:CGRect { return CGRect(with:self) }
}

internal extension Transform {
	var cgTransform:CGAffineTransform { return CGAffineTransform(with:self) }
}
