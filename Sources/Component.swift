
public protocol Component {
	var align:Alignment { get }
	var height:Dimension { get }
	var width:Dimension { get }
	var margin:Space { get }
}

// MARK: -

extension Component {
	public final var minBoxWidth:Unit { return width.min + margin.right + margin.left }
	public final var maxBoxWidth:Unit { return width.max + margin.right + margin.left }

	public final var minBoxHeight:Unit { return height.min + margin.top + margin.bottom }
	public final var maxBoxHeight:Unit { return height.max + margin.top + margin.bottom }

	public final var minBoxSize:Size { return Size(minBoxWidth, minBoxHeight) }
	public final var maxBoxSize:Size { return Size(maxBoxWidth, maxBoxHeight) }
}
