 
import Geometry
import Graphics
import Layouting
import Styling

public protocol Element : Container, Item {
	var overflow:Overflow { get }
	var content:[Element] { get }
	var style:Style { get }
}

// MARK: -

public extension Element {

	var overflow:Overflow { return style[Style.overflow] ?? .visible }

	var arrangement:Arrangement { return style[Style.arrangement] ?? .vertical }
	var distribution:Distribution { return style[Style.distribution] ?? .equal }
	var justify:Alignment { return style[Style.justify] ?? .leading }
	var padding:Padding { return style[Style.padding] ?? .zero }

	var alignment:Alignment { return style[Style.alignment] ?? .leading }
	var margin:Margin { return style[Style.margin] ?? .zero }
	var width:Axis { return style[Style.width] ?? .infinity }
	var height:Axis { return style[Style.height] ?? .infinity }
}
