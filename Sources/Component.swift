
public protocol Component {
	var alignment:Alignment { get }
	var overflow:Overflow { get }
	var height:Dimensions { get }
	var width:Dimensions { get }
	var margin:Margin { get }
}

public extension Component {

	var minimumSize:Size { return Size(width.min, height.min) }
	var maximumSize:Size { return Size(width.max, height.max) }

	subscript (arrangement:Arrangement) -> Dimensions {
		switch arrangement {
			case .horizontal: return width
			case .vertical: return height
		}
	}
}

public extension Component where Self : Stylable {
	var alignment:Alignment { return style.get("alignment") ?? .leading }
	var overflow:Overflow { return style.get("overflow") ?? .visible }
	var height:Dimensions { return style.get("height") ?? .infinity }
	var width:Dimensions { return style.get("width") ?? .infinity }
	var margin:Margin { return style.get("margin") ?? .zero }
}

public func == <Element:Component>(left:Element, right:Element) -> Bool {
	return type(of:left) == type(of:right)
}
