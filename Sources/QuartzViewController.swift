
import QuartzCore

internal extension QuartzViewController {
	func updateScene() {
		let w = Unit(view.bounds.size.width)
		let h = Unit(view.bounds.size.height)
		let size = Size(w, h)
		scene.update(size)
	}
}
