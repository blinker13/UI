
import Geometry

public func Horizontal(style:Style = [], _ children:Element ...) -> View {
	let compoundStyle:Style = [style, .arrangement(.horizontal)]
	return View(children:children, style:compoundStyle)
}

// MARK: -

public func Vertical(style:Style = [], _ children:Element ...) -> View {
	let compoundStyle:Style = [style, .arrangement(.vertical)]
	return View(children:children, style:compoundStyle)
}

// MARK: -

public func Inset(by padding:Space, _ children:Element ...) -> View {
	return View(children:children, style:.padding(padding))
}
