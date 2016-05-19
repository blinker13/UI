
public protocol Component {
	var alignment:Alignment { get }
	var height:Dimension { get }
	var width:Dimension { get }
	var margin:Space { get }
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
