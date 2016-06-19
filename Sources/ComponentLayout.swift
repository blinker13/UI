
import Canvas

internal struct ComponentLayout {

	internal struct Axis {

		internal let alignment:Alignment
		internal let arrangement:Arrangement
		internal let dimension:Length
		internal let edges:Edges

		internal var length:Real

		private init(_ component:Component, _ arrangement:Arrangement) {
			let dimension = component[arrangement]

			self.edges = component.margin[arrangement]
			self.alignment = component.alignment
			self.arrangement = arrangement
			self.length = dimension.min
			self.dimension = dimension
		}
	}

	internal let component:Component

	internal var cross:Axis
	internal var main:Axis

	internal init(_ component:Component, _ arrangement:Arrangement) {
		self.cross = Axis(component, arrangement.crossed)
		self.main = Axis(component, arrangement)
		self.component = component
	}
}

// MARK: -

internal extension ComponentLayout {

	var size:Size {
		let sizes = Dictionary(dictionaryLiteral:main.value, cross.value)
		return Size(values:sizes)
	}
}

// MARK: -

internal extension ComponentLayout.Axis {

	var difference:Real { return dimension.max - dimension.min }
	var isFlexible:Bool { return dimension.isFlexible }
	var total:Real { return length + edges.total }

	mutating func calculateLength(with constrain:Real) {
		let interim = min(dimension.max, constrain - edges.total)
		length = max(dimension.min, interim)
	}

	func calculatePosition(with remainder:Real) -> Real {
		return edges.leading + alignment.calculateOffset(with:remainder)
	}
}

private extension ComponentLayout.Axis {
	var value:(Arrangement, Real) { return (arrangement, length) }
}
