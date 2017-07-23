
public extension AppleViewController {

	public convenience init (with component:Component) {
		let scene = Scene(with:component)
		self.init(with:scene)
	}
}

internal extension AppleViewController {

	var currentSize:Size {
		let width = Float(view.frame.size.width)
		let height = Float(view.frame.size.height)
		return Size(width, height)
	}
}
