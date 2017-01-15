
internal extension QuartzViewController {
	
	func loadScene() {
		scene.update(with:currentSize)
		scene.display(with:renderer)
	}
}

private extension QuartzViewController {

	var currentSize:Size {
		let width = Float(view.frame.size.width)
		let height = Float(view.frame.size.height)
		return Size(width, height)
	}
}
