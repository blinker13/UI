
import Styling

public typealias Opacity = Float

public protocol Viewable {
	var background:Color? { get }
	var border:Border? { get }
	var isVisible:Bool { get }
	var opacity:Opacity { get }
	var shadow:Shadow? { get }
	var tint:Color { get }
}

public extension Viewable {
	var isVisible:Bool { return opacity > 0 }
}

public extension Viewable where Self : Stylable {
	var background:Color? { return style[Style.background] }
	var border:Border? { return style[Style.border] }
	var opacity:Opacity { return style[Style.opacity] ?? 1.0 }
	var shadow:Shadow? { return style[Style.shadow] }
	var tint:Color { return style[Style.tint] ?? Color.black }
}

