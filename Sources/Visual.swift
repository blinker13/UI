
public protocol Visual : Component {
	var background:Color? { get }
	var color:Color { get }
	var opacity:Unit { get }
	var border:Border? { get }
	var shadow:Shadow? { get }
}

// MARK: -

extension Visual {
	public var background:Color? { return style["background"] as? Color }
	public var color:Color { return style["color"] as? Color ?? Color.black }
	public var opacity:Unit { return style["opacity"] as? Unit ?? 1.0 }
	public var border:Border? { return style["border"] as? Border }
	public var shadow:Shadow? { return style["shadow"] as? Shadow }
}
