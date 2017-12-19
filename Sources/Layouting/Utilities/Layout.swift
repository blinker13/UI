
import Geometry

internal struct Layout {
	internal var align:Alignment
	internal var cross:Dimension
	internal var main:Dimension
}

// MARK: -

internal extension Layout {

	init (container:Container, in rect:Rect) {
		let mainSize = Axis(floatLiteral:rect.size[container.arrangement])
		let mainAxis = container.padding[container.arrangement]

		let crossSize = Axis(floatLiteral:rect.size[container.arrangement.flipped])
		let crossAxis = container.padding[container.arrangement.flipped]

		self.cross = Dimension(size:crossSize, axis:crossAxis)
		self.main = Dimension(size:mainSize, axis:mainAxis)
		self.align = container.justify
	}

	func justify(_ box:Layout) -> Float {
		let remainder = box.cross.size - cross.length
		let pitch = remainder * align.factor
		return pitch + box.cross[align]
	}

	func justify(_ remainder:Float) -> Float {
		let pitch = remainder * align.factor
		return pitch + main[align]
	}
}
