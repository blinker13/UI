
import Geometry
import Graphics
import Layout

public protocol Stylable : Viewable, Container, Item {
	var style:Style { get }
}

// MARK: -

public extension Stylable {

	var overflow:Overflow { return style[#function] ?? .hide }

	var arrangement:Arrangement { return style[#function] ?? .vertical }
	var distribution:Distribution { return style[#function] ?? .equal }
	var justify:Alignment { return style[#function] ?? .leading }
	var padding:Padding { return style[#function] ?? .zero }

	var alignment:Alignment { return style[#function] ?? .leading }
	var height:Axis { return style[#function] ?? .infinity }
	var width:Axis { return style[#function] ?? .infinity }
	var margin:Margin { return style[#function] ?? .zero }

	var background:Color? { return style[#function] }
	var border:Border? { return style[#function] }
	var opacity:Opacity? { return style[#function] }
	var shadow:Shadow? { return style[#function] }
	var tint:Color? { return style[#function] }
}
