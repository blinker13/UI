
internal struct ContainerLayout {

	internal struct Axis {

		internal let arrangement:Arrangement
		internal let constraint:Unit
		internal let edges:Edges

		private init(_ arrangement:Arrangement, _ constraint:Size, _ padding:Space) {
			self.constraint = constraint[arrangement]
			self.edges = padding[arrangement]
			self.arrangement = arrangement
		}
	}

	internal let cross:Axis
	internal let main:Axis

	private let container:Container

	internal init(_ container:Container, _ constraint:Size) {
		let size = constraint.inset(container.padding)
		self.cross = Axis(container.arrangement.crossed, size, container.padding)
		self.main = Axis(container.arrangement, size, container.padding)
		self.container = container
	}
}

// MARK: -

internal extension ContainerLayout {
	var alignment:Alignment { return container.justify }
	var components:EnumeratedSequence<[Component]> { return container.construct().enumerated() }
	var distribution:Distribution { return container.distribution }
}
