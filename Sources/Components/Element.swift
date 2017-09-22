
import Geometry
import Layouting
import Styling

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
	var alignment:Alignment { return style[Style.alignment] ?? .leading }
	var arrangement:Arrangement { return style[Style.arrangement] ?? .vertical }
	var distribution:Distribution { return style[Style.distribution] ?? .equal }
	var justify:Alignment { return style[Style.justify] ?? .leading }
	var overflow:Overflow { return style[Style.overflow] ?? .visible }
	var padding:Padding { return style[Style.padding] ?? .zero }
	var margin:Margin { return style[Style.margin] ?? .zero }
	var width:Axis { return style[Style.width] ?? .infinity }
	var height:Axis { return style[Style.height] ?? .infinity }
}


internal extension Component {

	var isScoped:Bool {
		return scope == scope
	}
}
