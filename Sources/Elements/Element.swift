 
import Geometry
import Graphics
import Layout

public protocol Renderer {
	func render() -> Element
}

// MARK: -

public struct Element : Container, Item, Renderer {

	internal let children:[Renderer]
	internal let style:Style

	public func render() -> Element {
		return self
	}
}

// MARK: -

public extension Element {

	//TODO: move to Style+...
	var background:Color? { return style[#function] }
	var border:Border? { return style[#function] }
	var opacity:Opacity { return style[#function] ?? 1.0 }
	var shadow:Shadow? { return style[#function] }
	var tint:Color { return style[#function] ?? Color.black }

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
