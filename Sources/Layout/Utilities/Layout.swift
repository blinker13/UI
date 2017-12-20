
import Geometry

internal final class Layout {

	internal var main = Dimension()
	internal var cross = Dimension()
	internal var align:Alignment

	internal init (align:Alignment) {
		self.align = align
	}
}

// MARK: -

internal extension Layout {
	func justify(_ box:Layout) -> Float {
		let remainder = box.cross.size - cross.length
		let pitch = remainder * align.factor
		return pitch + box.cross[align]
	}
}
