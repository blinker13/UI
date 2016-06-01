
public protocol Component : Layout {
	var style:Style { get }
}

// MARK: -

public extension Component {
	subscript (arrangement:Arrangement) -> Dimension {
		switch arrangement {
			case .Horizontal: return width
			case .Vertical: return height
		}
	}
}

// MARK: -

public extension Component where Self : Layout {
	var alignment:Alignment { return style["alignment"] as? Alignment ?? .Leading }
	var height:Dimension { return style["height"] as? Dimension ?? Dimension() }
	var width:Dimension { return style["width"] as? Dimension ?? Dimension() }
	var margin:Space { return style["margin"] as? Space ?? Space() }
}

// MARK: -

public extension Component where Self : Enclosure {
	var overflow:Overflow { return style["overflow"] as? Overflow ?? .Hidden }
}

// MARK: -

public func == <Element:Component>(left:Element, right:Element) -> Bool {
	return left.dynamicType == right.dynamicType
}
