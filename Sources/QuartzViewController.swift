
import Canvas

internal extension QuartzViewController {
	
	func updateScene() {
		let size = Size(quartz:view.bounds.size)
		scene.update(with:size)
	}
}
