
import Geometry

internal struct ComponentLayout {

	internal struct Axis {

		internal let alignment:Alignment
		internal let arrangement:Arrangement
		internal let dimensions:Axis
		internal let edges:Axis

		internal var length:Float

		fileprivate init (_ component:Element, _ arrangement:Arrangement) {
			let dimensions = component[arrangement]

			self.edges = component.margin[arrangement]
			self.alignment = component.alignment
			self.arrangement = arrangement
			self.length = dimensions.start
			self.dimensions = dimensions
		}
	}

	internal let component:Element

	internal var cross:Axis
	internal var main:Axis

	internal init (_ component:Element, _ arrangement:Arrangement) {
		self.cross = Axis(component, arrangement.crossed)
		self.main = Axis(component, arrangement)
		self.component = component
	}
}

internal extension ComponentLayout {

	var size:Size {
		let sizes = Dictionary(dictionaryLiteral:main.value, cross.value)
		return Size(values:sizes)
	}
}

internal extension ComponentLayout.Axis {

	var difference:Float { return dimensions.start - dimensions.end }
	var isFlexible:Bool { return dimensions.isFlexible }
	var total:Float { return length + edges.total }

	mutating func calculateLength(with constrain:Float) {
		let interim = min(dimensions.end, constrain - edges.total)
		length = max(dimensions.start, interim)
	}

	func calculatePosition(with remainder:Float) -> Float {
		return edges.leading + alignment.calculateOffset(with:remainder)
	}
}

private extension ComponentLayout.Axis {
	var value:(Arrangement, Float) { return (arrangement, length) }
}

