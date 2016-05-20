
public protocol Component : Layout {
	var style:Style { get }
}

// MARK: -

extension Component {
	public var alignment:Alignment { return style["alignment"] as? Alignment ?? .Leading }
	public var height:Dimension { return style["height"] as? Dimension ?? Dimension() }
	public var width:Dimension { return style["width"] as? Dimension ?? Dimension() }
	public var margin:Space { return style["margin"] as? Space ?? Space() }
}

// MARK: -

extension Component {
	public subscript (arrangement:Arrangement) -> Dimension {
		switch arrangement {
			case .Horizontal: return width
			case .Vertical: return height
		}
	}
}

// MARK: -

public func == <Element:Component>(left:Element, right:Element) -> Bool {
	return left.dynamicType == right.dynamicType
}
