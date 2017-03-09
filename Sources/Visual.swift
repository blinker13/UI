
public typealias Opacity = Float

public protocol Visual {
	var background:Color? { get }
	var border:Border? { get }
	var color:Color { get }
	var opacity:Opacity { get }
	var shadow:Shadow? { get }
}

internal extension Visual {
	var isVisible:Bool { return opacity > 0 }
}

public extension Visual where Self : Stylable {
	var background:Color? { return style.get("background") }
	var border:Border? { return style.get("border") }
	var color:Color { return style.get("color") ?? Color.black }
	var opacity:Opacity { return style.get("opacity") ?? 1.0 }
	var shadow:Shadow? { return style.get("shadow") }
}
