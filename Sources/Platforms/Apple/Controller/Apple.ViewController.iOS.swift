
#if os(iOS)

import UIKit
import Geometry

public final class AppleViewController : UIViewController {

	internal let renderer:Renderer

	internal init (with scene:Scene) {
		self.renderer = Renderer(with:scene)
		super.init(nibName:nil, bundle:nil)
	}

	public required init? (coder:NSCoder) {
		fatalError()
	}
}

// MARK: -

public extension AppleViewController {

	convenience init (with element:Element) {
		let scene = Scene(with:element)
		self.init(with:scene)
	}

	override func loadView() {
		view = Apple.View(frame:.zero)
		view.isMultipleTouchEnabled = true
		view.backgroundColor = UIColor.white
		view.layer.addSublayer(layer)
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
//	override func viewWillAppear(_ animated:Bool) {
//		super.viewWillAppear(animated)
//		scene.onStart()
//	}
//
//	override func viewDidAppear(_ animated:Bool) {
//		super.viewDidAppear(animated)
//		scene.onResume()
//	}
//
//	override func viewWillDisappear(_ animated:Bool) {
//		super.viewWillDisappear(animated)
//		scene.onPause()
//	}
//
//	override func viewDidDisappear(_ animated:Bool) {
//		super.viewDidDisappear(animated)
//		scene.onStop()
//	}
//}

// MARK: -

	var foobar:TimeInterval = 0.0

public extension AppleViewController {

	override func touchesBegan(_ touches:Set<UITouch>, with event:UIEvent?) {
		process(event!) { _ in return false }
	}

	override func touchesMoved(_ touches:Set<UITouch>, with event:UIEvent?) {
		process(event!) { return $0.phase == .began }
	}

	override func touchesEnded(_ touches:Set<UITouch>, with event:UIEvent?) {
		process(event!) { return $0.phase == .began || $0.phase == .moved }
	}
	override func touchesCancelled(_ touches:Set<UITouch>, with event:UIEvent?) {
		process(event!) { return $0.phase != .stationary || $0.phase != .cancelled }
	}
}

// MARK: -

internal extension AppleViewController {
	var scene:Scene { return renderer.scene }
	var layer:CALayer { return renderer.layer }
}

// MARK: -

private extension AppleViewController {

	func process(_ event:UIEvent, with filter:(UITouch) -> Bool) {
		guard let uiTouches = event.touches(for:view) else { return }
		if uiTouches.contains(where:filter) { return }
		if uiTouches.isEmpty { return }

		let touches = uiTouches.map(transform)
		let gesture = Gesture(touches:Set(touches), timestamp:event.timestamp)
		scene.send(gesture)
	}

	func transform(uiTouch:UITouch) -> Touch {
		let point = uiTouch.location(in:view)
		let location = Point(cg:point)
		let node = scene.test(location)

		return Touch(
			hashValue:uiTouch.hashValue,
			timestamp:uiTouch.timestamp,
			location:location,
			force:Touch.Force(uiTouch.force),
			phase:uiTouch.phase.touchPhase,
			count:uiTouch.tapCount,
			node:node!
		)
	}
}

#endif
