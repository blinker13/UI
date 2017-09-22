
import Geometry

internal extension Flex {

	internal struct Item {

		internal struct Axisis {

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

		internal var cross:Axisis
		internal var main:Axisis

		internal init (_ component:Element, _ arrangement:Arrangement) {
			self.cross = Axis(component, arrangement.crossed)
			self.main = Axis(component, arrangement)
			self.component = component
		}
	}
}

