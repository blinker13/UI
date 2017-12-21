 
import Geometry
import Layout

public protocol Element : Container, Item {
	var content:[Element] { get }
	var overflow:Overflow { get }
	var style:Style { get }
}

// MARK: -

public extension Element {

	var overflow:Overflow { return style[#function] ?? .show }

	var arrangement:Arrangement { return style[#function] ?? .vertical }
	var distribution:Distribution { return style[#function] ?? .equal }
	var justify:Alignment { return style[#function] ?? .leading }
	var padding:Padding { return style[#function] ?? .zero }

	var alignment:Alignment { return style[#function] ?? .leading }
	var margin:Margin { return style[#function] ?? .zero }
	var width:Axis { return style[#function] ?? .infinity }
	var height:Axis { return style[#function] ?? .infinity }
}
