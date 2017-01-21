
internal struct ContainerLayout {

	internal struct Axis {

		internal let arrangement:Arrangement
		internal let constraint:Float
		internal let edges:Edges

		fileprivate init (_ arrangement:Arrangement, _ constraint:Size, _ padding:Space) {
			self.constraint = constraint[arrangement]
			self.edges = padding[arrangement]
			self.arrangement = arrangement
		}
	}

	internal let cross:Axis
	internal let main:Axis

	fileprivate let container:Component

	internal init (_ container:Component, _ constraint:Size) {
		let size = constraint.inseted(by:container.padding)
		self.cross = Axis(container.arrangement.crossed, size, container.padding)
		self.main = Axis(container.arrangement, size, container.padding)
		self.container = container
	}
}

internal extension ContainerLayout {
	var alignment:Alignment { return container.justify }
	var components:EnumeratedSequence<[Component]> { return container.construct().enumerated() }
	var distribution:Distribution { return container.distribution }
}
