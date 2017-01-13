
import Geometry

internal extension QuartzViewController {
	
	func updateScene() {
		let w = Float(view.bounds.size.width)
		let h = Float(view.bounds.size.height)
		let size = Size(w, h)
		scene.update(with:size)
	}
}
