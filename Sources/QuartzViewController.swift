
import Geometry

internal extension QuartzViewController {
	
	func updateScene() {
		let w = Real(view.bounds.size.width)
		let h = Real(view.bounds.size.height)
		let size = Size(w, h)
		scene.update(with:size)
	}
}
