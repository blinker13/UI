
public typealias Opacity = Float

public protocol Visable {
	var background:Color? { get }
	var border:Border? { get }
	var opacity:Opacity { get }
	var shadow:Shadow? { get }
	var tint:Color { get }
}

internal extension Visable {
	var isVisible:Bool { return opacity > 0 }
}

public extension Visable where Self : Stylable {
	var background:Color? { return style.background }
	var border:Border? { return style.border }
	var opacity:Opacity { return style.opacity ?? 1.0 }
	var shadow:Shadow? { return style.shadow }
	var tint:Color { return style.tint ?? Color.black }
}