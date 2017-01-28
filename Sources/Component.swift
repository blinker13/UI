
public protocol Component {

	var alignment:Alignment { get }
	var arrangement:Arrangement { get }
	var distribution:Distribution { get }
	var justify:Alignment { get }
	var overflow:Overflow { get }
	var height:Dimensions { get }
	var width:Dimensions { get }
	var padding:Padding { get }
	var margin:Margin { get }

//	func construct(with context:Context) -> [Component]
	func construct() -> [Component]
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

public extension Component {
	var alignment:Alignment { return .leading }
	var arrangement:Arrangement { return .vertical }
	var distribution:Distribution { return .equal }
	var justify:Alignment { return .leading }
	var overflow:Overflow { return .visible }
	var height:Dimensions { return .infinity }
	var width:Dimensions { return .infinity }
	var padding:Padding { return .zero }
	var margin:Margin { return .zero }
}

public extension Component where Self : Stylable {
	var alignment:Alignment { return style.alignment ?? .leading }
	var arrangement:Arrangement { return style.arrangement ?? .vertical }
	var distribution:Distribution { return style.distribution ?? .equal }
	var justify:Alignment { return style.justify ?? .leading }
	var overflow:Overflow { return style.overflow ?? .visible }
	var height:Dimensions { return style.height ?? .infinity }
	var width:Dimensions { return style.width ?? .infinity }
	var padding:Padding { return style.padding ?? .zero }
	var margin:Margin { return style.margin ?? .zero }
}

public func == <Element:Component>(left:Element, right:Element) -> Bool {
	return type(of:left) == type(of:right)
}
