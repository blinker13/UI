
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
	var padding:Padding { return .zero }
	var margin:Margin { return .zero }
	var width:Axis { return .infinity }
	var height:Axis { return .infinity }

	var scope:Scope { return Scope() }

	subscript (arrangement:Arrangement) -> Axis {
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
	var padding:Padding { return style.padding ?? .zero }
	var margin:Margin { return style.margin ?? .zero }
	var width:Axis { return style.width ?? .infinity }
	var height:Axis { return style.height ?? .infinity }
}


internal extension Component {

	var isScoped:Bool {
		return scope == scope
	}
}
