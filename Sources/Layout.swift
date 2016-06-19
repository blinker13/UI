
import Canvas

public protocol Layout {
	var alignment:Alignment { get }
	var height:Length { get }
	var width:Length { get }
	var margin:Space { get }
}

// MARK: -

public protocol Enclosure : Layout {
	var overflow:Overflow { get }
}

// MARK: -

public protocol Containment : Enclosure {
	var arrangement:Arrangement { get }
	var distribution:Distribution { get }
	var justify:Alignment { get }
	var padding:Space { get }
}
