
import Canvas

public protocol Component : Layout {
	var style:Style { get }
}

public extension Component {

	var alignment:Alignment { return style["alignment"] as? Alignment ?? .leading }
	var height:Dimensions { return style["height"] as? Dimensions ?? Dimensions() }
	var width:Dimensions { return style["width"] as? Dimensions ?? Dimensions() }
	var margin:Space { return style["margin"] as? Space ?? Space() }

	subscript (arrangement:Arrangement) -> Dimensions {
		switch arrangement {
			case .horizontal: return width
			case .vertical: return height
		}
	}
}

public extension Component where Self : Enclosure {
	var overflow:Overflow { return style["overflow"] as? Overflow ?? .hidden }
}

public func == <Element:Component>(left:Element, right:Element) -> Bool {
	return left.dynamicType == right.dynamicType
}
