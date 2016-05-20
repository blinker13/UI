
public protocol Layout {
	var alignment:Alignment { get }
	var height:Dimension { get }
	var width:Dimension { get }
	var margin:Space { get }
}

// MARK: -

public protocol Containment : Layout {
	var arrangement:Arrangement { get }
	var distribution:Distribution { get }
	var justify:Alignment { get }
	var padding:Space { get }
}
