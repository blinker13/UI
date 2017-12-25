
#if os(OSX)

import AppKit
import Geometry

public final class AppleViewController : NSViewController {

	internal let renderer:Apple.Renderer

	internal init (with scene:Scene) {
		self.renderer = Apple.Renderer(with:scene)
		super.init(nibName:nil, bundle:nil)
	}

	public required init? (coder:NSCoder) {
		fatalError()
	}
}

// MARK: -

public extension AppleViewController {

	override var preferredMinimumSize:NSSize { return CGSize(with:scene.minimum) }
	override var preferredMaximumSize:NSSize { return CGSize(with:scene.maximum) }

	convenience init (with element:Element) {
		let scene = Scene(with:element)
		self.init(with:scene)
	}

	override func loadView() {
		let rect = NSRect(origin:.zero, size:Apple.bounds.size)
		view = Apple.View(frame:rect)
		view.layer = renderer.layer
		view.wantsLayer = true
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		renderer.render()
	}
}

//// MARK: -
//
//public extension AppleViewController {
//
//	override func viewWillAppear() {
//		super.viewWillAppear()
//		scene.onStart()
//	}
//
//	override func viewDidAppear() {
//		super.viewDidAppear()
//		scene.onResume()
//	}
//
//	override func viewWillDisappear() {
//		super.viewWillDisappear()
//		scene.onPause()
//	}
//
//	override func viewDidDisappear() {
//		super.viewDidDisappear()
//		scene.onStop()
//	}
//}

//// MARK: -
//
//public extension AppleViewController {
//
//	override func mouseDown(with event:NSEvent) {
//		forwardGesture(event)
//	}
//
//	override func mouseDragged(with event:NSEvent) {
//		forwardGesture(event)
//	}
//
//	override func mouseUp(with event:NSEvent) {
//		forwardGesture(event)
//	}
//}

// MARK: -

private extension AppleViewController {

	var scene:Scene { return renderer.scene }
	var layer:CALayer { return renderer.layer }

//	func forwardGesture(_ event:NSEvent) {
////		let location = convert(event.locationInWindow)
////		guard let node = node(for:location with:event) else { return }
////		let pointers = event.pointers(with:node, in:location)
////		let gesture = Gesture(touches:pointers, timestamp:event.timestamp)
////		scene.send(gesture)
//	}
//
//	func convert(_ point:CGPoint) -> Point {
//		let location = view.convert(point, from:nil)
//		return Point(cg:location)
//	}
//
//	func node(for location:Point, with event:NSEvent) -> Node? {
//
//		return renderer.scene.test(location)
//	}
}

#endif
