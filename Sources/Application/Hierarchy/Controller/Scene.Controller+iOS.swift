
#if os(iOS)

import UIKit
import Geometry

//// MARK: -
//
//public extension Scene.Controller {
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

//public extension Scene.Controller {
//
//	override func touchesBegan(_ touches:Set<UITouch>, with event:UIEvent?) {
//		process(event!) { _ in return false }
//	}
//
//	override func touchesMoved(_ touches:Set<UITouch>, with event:UIEvent?) {
//		process(event!) { return $0.phase == .began }
//	}
//
//	override func touchesEnded(_ touches:Set<UITouch>, with event:UIEvent?) {
//		process(event!) { return $0.phase == .began || $0.phase == .moved }
//		touches.forEach(remove)
//	}
//	override func touchesCancelled(_ touches:Set<UITouch>, with event:UIEvent?) {
//		process(event!) { return $0.phase != .stationary || $0.phase != .cancelled }
//		touches.forEach(remove)
//	}
//}

// MARK: -

//private extension Scene.Controller {
//
//	func process(_ event:UIEvent, with filter:(UITouch) -> Bool) {
//		guard let uiTouches = event.touches(for:view) else { return }
//		if uiTouches.contains(where:filter) { return }
//		if uiTouches.isEmpty { return }
//
//		let touches = uiTouches.map(transform)
//		let gesture = Gesture(timestamp:event.timestamp, touches:Set(touches))
//		scene.send(gesture)
//	}
//
//	func transform(touch:UITouch) -> Touch {
//		let point = touch.location(in:view)
//		let location = Point(cg:point)
//
//		return Touch(
//			hashValue:touch.hashValue,
//			timestamp:touch.timestamp,
//			location:location,
//			force:Touch.Force(touch.force),
//			phase:touch.phase.touchPhase,
//			count:touch.tapCount,
//			scene:scene,
//			node:test(touch, in:location)
//		)
//	}
//
//	func test(_ touch:UITouch, in location:Point) -> Node? {
//		if let node = responder[touch] { return node }
//		guard let node = scene.test(location) else { return nil }
//		responder[touch] = node
//		return node
//	}
//
//	func remove(touch:UITouch) {
//		responder.removeValue(forKey:touch)
//	}
//}

#endif
