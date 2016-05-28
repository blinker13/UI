
public protocol Visual : Enclosure {
	var background:Color? { get }
	var border:Border? { get }
	var color:Color { get }
	var opacity:Unit { get }
	var shadow:Shadow? { get }
}

// MARK: -

extension Visual where Self : Component {
	public var background:Color? { return style["background"] as? Color }
	public var border:Border? { return style["border"] as? Border }
	public var color:Color { return style["color"] as? Color ?? Color.black }
	public var opacity:Unit { return style["opacity"] as? Unit ?? 1.0 }
	public var shadow:Shadow? { return style["shadow"] as? Shadow }
}
