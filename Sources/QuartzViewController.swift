
internal extension QuartzViewController {

	var currentSize:Size {
		let width = Float(view.frame.size.width)
		let height = Float(view.frame.size.height)
		return Size(width, height)
	}
}
