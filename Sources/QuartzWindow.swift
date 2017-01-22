
internal extension QuartzWindow {

	internal convenience init (with component:Component) {
		let window = Window.wrap(component)
		self.init(with:window)
	}
}
