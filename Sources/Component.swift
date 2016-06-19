
import Canvas

public protocol Component : Layout {
	var style:Style { get }
}

public extension Component {
	subscript (arrangement:Arrangement) -> Length {
		switch arrangement {
			case .horizontal: return width
			case .vertical: return height
		}
	}
}

public extension Component {
	var alignment:Alignment { return style["alignment"] as? Alignment ?? .leading }
	var height:Length { return style["height"] as? Length ?? Length() }
	var width:Length { return style["width"] as? Length ?? Length() }
	var margin:Space { return style["margin"] as? Space ?? Space() }
}

public extension Component where Self : Enclosure {
	var overflow:Overflow { return style["overflow"] as? Overflow ?? .hidden }
}

public func == <Element:Component>(left:Element, right:Element) -> Bool {
	return left.dynamicType == right.dynamicType
}
