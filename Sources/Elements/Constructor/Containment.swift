
import Geometry

public func View(style:Style, _ children:Renderer ...) -> Element {
	return Element(children:children, style:style)
}

public func View(style:Style, children:[Renderer]) -> Element {
	return Element(children:children, style:style)
}

public func View(style:Style, block:() -> [Element]) -> Element {
	return Element(children:block(), style:style)
}

// MARK: -

public func Horizontal(style:Style, _ children:Renderer ...) -> Element {
	let compoundStyle:Style = [style, .arrangement(.horizontal)]
	return Element(children:children, style:compoundStyle)
}

// MARK: -

public func Vertical(style:Style, _ children:Renderer ...) -> Element {
	let compoundStyle:Style = [style, .arrangement(.vertical)]
	return Element(children:children, style:compoundStyle)
}

// MARK: -

public func Inset(by padding:Space, _ children:Renderer ...) -> Element {
	return Element(children:children, style:.padding(padding))
}
