
import Graphics
import Styling

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

public extension Viewable where Self : Element {
	var background:Color? { return style[#function] }
	var border:Border? { return style[#function] }
	var opacity:Opacity { return style[#function] ?? 1.0 }
	var shadow:Shadow? { return style[#function] }
	var tint:Color { return style[#function] ?? Color.black }
}
