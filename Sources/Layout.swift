
import Canvas

public typealias Margin = Space
public typealias Padding = Space

public protocol Layout {
	var alignment:Alignment { get }
	var height:Dimensions { get }
	var width:Dimensions { get }
	var margin:Margin { get }
}

public protocol Enclosure : Layout {
	var overflow:Overflow { get }
}

public protocol Containment : Enclosure {
	var arrangement:Arrangement { get }
	var distribution:Distribution { get }
	var justify:Alignment { get }
	var padding:Padding { get }
}
