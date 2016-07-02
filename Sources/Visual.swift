
import Canvas

public typealias Opacity = Real

public protocol Visual : Enclosure {
	var background:Color? { get }
	var border:Border? { get }
	var color:Color { get }
	var opacity:Opacity { get }
	var shadow:Shadow? { get }
}

public extension Component where Self : Visual {
	var background:Color? { return style["background"] as? Color }
	var border:Border? { return style["border"] as? Border }
	var color:Color { return style["color"] as? Color ?? Color.black }
	var opacity:Opacity { return style["opacity"] as? Opacity ?? 1.0 }
	var shadow:Shadow? { return style["shadow"] as? Shadow }
}
