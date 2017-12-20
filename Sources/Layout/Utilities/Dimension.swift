
import Geometry

internal struct Dimension : Alignable {
	internal var sizes:Axis = .infinity
	internal var axis:Axis = .infinity
	internal var start:Float = 0
}

// MARK: -

internal extension Dimension {

	var size:Float { return sizes.start }
	var length:Float { return size + axis.total }
	var isFlexible:Bool { return sizes.isFlexible }

	var leading:Float { return axis.leading }
	var center:Float { return axis.center }
	var trailing:Float { return -axis.trailing }

	init (size:Axis, axis:Axis) {
		self.sizes = size
		self.axis = axis
	}
}
