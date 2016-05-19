
internal struct ContainerLayout {

	internal struct Axis {

		internal let arrangement:Arrangement
		internal let constraint:Unit
		internal let edges:Edges

		// MARK: -

		private init(_ arrangement:Arrangement, _ constraint:Size, _ padding:Space) {
			self.constraint = constraint[arrangement]
			self.edges = padding[arrangement]
			self.arrangement = arrangement
		}
	}

	// MARK: -

	internal let cross:Axis
	internal let main:Axis

	private let container:Container

	// MARK: -

	internal init(_ container:Container, _ constraint:Size) {
		let size = constraint.inset(container.padding)
		self.cross = Axis(container.arrangement.crossed, size, container.padding)
		self.main = Axis(container.arrangement, size, container.padding)
		self.container = container
	}
}

// MARK: -

extension ContainerLayout {
	internal var alignment:Alignment { return container.contentAlignment }
	internal var components:EnumerateSequence<[Component]> { return container.construct().enumerate() }
	internal var distribution:Distribution { return container.distribution }
	internal var isReversed:Bool { return container.alignment == .Trailing }
}
