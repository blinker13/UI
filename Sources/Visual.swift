
import Canvas

public typealias Opacity = Real

public protocol Visual {
	var background:Color? { get }
	var border:Border? { get }
	var color:Color { get }
	var opacity:Opacity { get }
	var shadow:Shadow? { get }
}

public extension Style {
	var background:Color? { return self["background"] as? Color }
	var border:Border? { return self["border"] as? Border }
	var color:Color { return self["color"] as? Color ?? Color.black }
	var opacity:Opacity { return self["opacity"] as? Opacity ?? 1.0 }
	var shadow:Shadow? { return self["shadow"] as? Shadow }
}

public extension Component where Self : Visual {
	var background:Color? { return style.background }
	var border:Border? { return style.border }
	var color:Color { return style.color }
	var opacity:Opacity { return style.opacity }
	var shadow:Shadow? { return style.shadow }
}

