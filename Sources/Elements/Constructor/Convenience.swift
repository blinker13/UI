
import Geometry

public func Spacing(_ size:Float) -> Element {
	let style:Style = [.width(size), .height(size), .align(.center)]
	return Element(children:[], style:style)
}
