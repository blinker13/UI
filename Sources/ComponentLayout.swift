
internal struct ComponentLayout {

	internal struct Axis {

		internal let alignment:Alignment
		internal let arrangement:Arrangement
		internal let dimensions:Dimensions
		internal let edges:Edges

		internal var length:Float

		fileprivate init (_ component:Element, _ arrangement:Arrangement) {
			let dimensions = component[arrangement]

			self.edges = component.margin[arrangement]
			self.alignment = component.alignment
			self.arrangement = arrangement
			self.length = dimensions.min
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

	var difference:Float { return dimensions.max - dimensions.min }
	var isFlexible:Bool { return dimensions.isFlexible }
	var total:Float { return length + edges.total }

	mutating func calculateLength(with constrain:Float) {
		let interim = min(dimensions.max, constrain - edges.total)
		length = max(dimensions.min, interim)
	}

	func calculatePosition(with remainder:Float) -> Float {
		return edges.leading + alignment.calculateOffset(with:remainder)
	}
}

private extension ComponentLayout.Axis {
	var value:(Arrangement, Float) { return (arrangement, length) }
}
