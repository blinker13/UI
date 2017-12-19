
import Geometry

public protocol Item {
	var alignment:Alignment { get }
	var margin:Margin { get }
	var height:Axis { get }
	var width:Axis { get }
}

// MARK: -

internal extension Item {

	subscript (arrangement:Arrangement) -> Axis {
		switch arrangement {
			case .horizontal: return width
			case .vertical: return height
		}
	}
}
