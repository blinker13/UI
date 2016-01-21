
public protocol VisualType : ComponentType {
	var border:Border { get }
	var color:Color { get }
	var shadow:Shadow { get }
}

// MARK: -

extension VisualType {
	public var border:Border { return Border() }
	public var color:Color { return Color.black }
	public var shadow:Shadow { return Shadow() }
}
