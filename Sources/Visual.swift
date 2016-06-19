
import Canvas

public protocol Visual : Enclosure {
	var background:Color? { get }
	var border:Border? { get }
	var color:Color { get }
	var opacity:Real { get }
	var shadow:Shadow? { get }
}

// MARK: -

public extension Component where Self : Visual {
	var background:Color? { return style["background"] as? Color }
	var border:Border? { return style["border"] as? Border }
	var color:Color { return style["color"] as? Color ?? Color.black }
	var opacity:Real { return style["opacity"] as? Real ?? 1.0 }
	var shadow:Shadow? { return style["shadow"] as? Shadow }
}
