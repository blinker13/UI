
internal struct ComponentLayout {

	internal struct Axis {

		internal let alignment:Alignment
		internal let arrangement:Arrangement
		internal let dimension:Dimension
		internal let edges:Edges

		internal var length:Unit

		// MARK: -

		private init(_ component:Component, _ arrangement:Arrangement) {
			let dimension = component[arrangement]

			self.edges = component.margin[arrangement]
			self.alignment = component.alignment
			self.arrangement = arrangement
			self.length = dimension.min
			self.dimension = dimension
		}
	}

	// MARK: -

	internal let component:Component

	internal var cross:Axis
	internal var main:Axis

	// MARK: -

	internal init(_ component:Component, _ arrangement:Arrangement) {
		self.cross = Axis(component, arrangement.crossed)
		self.main = Axis(component, arrangement)
		self.component = component
	}
}

// MARK: -

extension ComponentLayout {
	internal var size:Size {
		let sizes = Dictionary(dictionaryLiteral:main.value, cross.value)
		return Size(values:sizes)
	}
}

// MARK: -

extension ComponentLayout.Axis {

	internal var difference:Unit { return dimension.max - dimension.min }
	internal var isFlexible:Bool { return dimension.isFlexible }
	internal var total:Unit { return length + edges.total }

	private var value:(Arrangement, Unit) {
		return (arrangement, length)
	}

	internal mutating func calculateLength(with constrain:Unit) {
		let interim = min(dimension.max, constrain - edges.total)
		length = max(dimension.min, interim)
	}

	internal func calculatePosition(with remainder:Unit) -> Unit {
		return edges.leading + alignment.calculateOffset(with:remainder)
	}
}
