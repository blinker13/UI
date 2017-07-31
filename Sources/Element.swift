
public protocol Element : Container, Item {
	var children:[Element] { get }
	var scope:Scope { get }
}

public extension Element {

	var alignment:Alignment { return .leading }
	var arrangement:Arrangement { return .vertical }
	var distribution:Distribution { return .equal }
	var justify:Alignment { return .leading }
	var overflow:Overflow { return .visible }
	var height:Dimensions { return .infinity }
	var width:Dimensions { return .infinity }
	var padding:Padding { return .zero }
	var margin:Margin { return .zero }

	var scope:Scope { return Scope() }

	subscript (arrangement:Arrangement) -> Dimensions {
		switch arrangement {
		case .horizontal: return width
		case .vertical: return height
		}
	}
}

public extension Element where Self : Stylable {
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


internal extension Component {

	var isScoped:Bool {
		return scope == scope
	}
}
