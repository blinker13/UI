
public protocol Visual : Enclosure {
	var background:Color? { get }
	var border:Border? { get }
	var color:Color { get }
	var opacity:Unit { get }
	var shadow:Shadow? { get }
}

// MARK: -

public extension Component where Self : Visual {
	var background:Color? { return style["background"] as? Color }
	var border:Border? { return style["border"] as? Border }
	var color:Color { return style["color"] as? Color ?? Color.black }
	var opacity:Unit { return style["opacity"] as? Unit ?? 1.0 }
	var shadow:Shadow? { return style["shadow"] as? Shadow }
}
