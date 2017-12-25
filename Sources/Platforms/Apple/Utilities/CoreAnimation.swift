
import QuartzCore
import Graphics

internal extension CALayer {

	convenience init (delegate:CALayerDelegate) {
		defer { self.delegate = delegate }
		self.init()
	}

	func insert(_ layer:CALayer, at index:Int) {
		insertSublayer(layer, at:UInt32(index))
	}
}
