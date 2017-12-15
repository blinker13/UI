
#if os(OSX)

import AppKit
import Geometry

public extension AppleViewController {

	override var preferredMinimumSize:NSSize { return CGSize(with:scene.minimum) }
	override var preferredMaximumSize:NSSize { return CGSize(with:scene.maximum) }

	// MARK: Lifecyle

	override func loadView() {
		let rect = NSRect(origin:.zero, size:Apple.Window.bounds.size)
		view = Apple.View(frame:rect)
	}

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

	// MARK: Layout

	override func viewWillLayout() {
		layer.contentsScale = view.window?.backingScaleFactor ?? 1
		super.viewWillLayout()
	}

//	override func viewDidLayout() {
//		super.viewDidLayout()
//	}

	// MARK: Events

	public override func mouseDown(with event:NSEvent) {
		forwardGesture(event)
	}

	public override func mouseDragged(with event:NSEvent) {
		forwardGesture(event)
	}

	public override func mouseUp(with event:NSEvent) {
		forwardGesture(event)
	}
}

// MARK: -

internal extension AppleViewController {
	var layer:CALayer { return view.layer! }
}

// MARK: -

private extension AppleViewController {

	func forwardGesture(_ event:NSEvent) {
//		let location = convert(event.locationInWindow)
//		let digit = event.digitize(with:location)
//
//		guard let node = scene.test(digit) else { return }
//
//		let pointers = event.pointers(with:node, in:location)
//		let gesture = Gesture(touches:pointers, timestamp:event.timestamp)
//
//		scene.onEvent(gesture)
	}

	func convert(_ point:CGPoint) -> Point {
		let location = view.convert(point, from:nil)
		return Point(cg:location)
	}
}

#endif
