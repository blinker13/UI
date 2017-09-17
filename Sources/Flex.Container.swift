
internal extension Flex {

	internal struct Container {

		internal struct Axis {

			internal let arrangement:Arrangement
			internal let constraint:Float
			internal let edges:UI.Axis

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
			let size = node.frame.size.inseted(by:node.element.padding)
			self.cross = Axis(node.element.arrangement.crossed, size, node.element.padding)
			self.main = Axis(node.element.arrangement, size, node.element.padding)
			self.distribution = node.element.distribution
			self.justify = node.element.justify
		}
	}
}
