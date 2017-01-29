
internal extension Flex {

	internal struct Container {

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

		internal let main:Axis
		internal let cross:Axis
		internal let distribution:Distribution
		internal let justify:Alignment

		internal init (with node:Node) {
			let size = node.frame.size.inseted(by:node.component.padding)
			self.cross = Axis(node.component.arrangement.crossed, size, node.component.padding)
			self.main = Axis(node.component.arrangement, size, node.component.padding)
			self.distribution = node.component.distribution
			self.justify = node.component.justify
		}
	}
}
