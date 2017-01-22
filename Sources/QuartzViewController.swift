
public extension QuartzViewController {

	public convenience init (with window:Window) {
		let scene = Scene(with:window)
		self.init(with:scene)
	}

	public convenience init (with component:Component) {
		let window = Window(with:component)
		self.init(with:window)
	}
}

internal extension QuartzViewController {

	var currentSize:Size {
		let width = Float(view.frame.size.width)
		let height = Float(view.frame.size.height)
		return Size(width, height)
	}
}
