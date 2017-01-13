
import Geometry

public protocol Component {
	var alignment:Alignment { get }
	var overflow:Overflow { get }
	var height:Dimensions { get }
	var width:Dimensions { get }
	var margin:Margin { get }
}

public extension Component {

	var overflow:Overflow { return .visible }

	var minimumSize:Size { return Size(width.min, height.min) }
	var maximumSize:Size { return Size(width.max, height.max) }

	subscript (arrangement:Arrangement) -> Dimensions {
		switch arrangement {
			case .horizontal: return width
			case .vertical: return height
		}
	}
}

public func == <Element:Component>(left:Element, right:Element) -> Bool {
	return type(of:left) == type(of:right)
}
