
#if os(OSX)

import AppKit

public final class AppKitViewController : NSViewController {

	private let scene:Scene

	internal init (with scene:Scene) {
		(self.scene) = (scene)
		super.init(nibName:nil, bundle:nil)
	}

	public required init? (coder:NSCoder) {
		fatalError()
	}
}

// MARK: -

public extension AppKitViewController {

	override func loadView() {
		guard let screen = NSScreen.main else { fatalError() }

		let vertical = round(screen.frame.height * 0.15)
		let horizontal = round(screen.frame.width * 0.2)
		let rect = screen.frame.insetBy(dx:horizontal, dy:vertical)

		view = AppKitView(frame:rect)
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		// TODO: Scene.flush
	}
}

// MARK: -

//public extension Scene.Controller {
//
//	override var preferredMinimumSize:NSSize {
//		return CGSize(with:scene.minimum)
//	}
//
//	override var preferredMaximumSize:NSSize {
//		return CGSize(with:scene.maximum)
//	}
//}

//// MARK: -
//
//public extension SceneController {
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

// MARK: -

//public extension Scene.Controller {
//
//	override func mouseDown(with event:NSEvent) {
//		process(event)
//	}
//
//	override func mouseDragged(with event:NSEvent) {
//		process(event)
//	}
//
//	override func mouseUp(with event:NSEvent) {
//		process(event)
//	}
//}

// MARK: -

//private extension Scene.Controller {
//
//	func process(_ event:NSEvent) {
//		//		let touch = transform(event)
//		//		let timestamp = Timestamp(event.timestamp)
//		//		let gesture = Gesture(timestamp:timestamp, touches:[touch])
//		//		scene.send(gesture)
//	}
//
//	func transform(_ event:NSEvent) -> Touch {
//		let point = view.convert(event.locationInWindow, from:nil)
//		let location = Point(cg:point)
//
//		return Touch(
//			hashValue:event.eventNumber,
//			timestamp:Timestamp(event.timestamp),
//			location:location,
//			force:Touch.Force(event.pressure),
//			phase:event.touchPhase,
//			count:event.clickCount,
//			scene:scene,
//			node:test(event, in:location)
//		)
//	}
//
//	func test(_ event:NSEvent, in location:Point) -> Node? {
//		//		if let node = responder[event.eventNumber] { return node }
//		//		guard let node = scene.test(location) else { return nil }
//		//		responder[event.eventNumber] = node
//		//		return node
//		return nil
//	}
//
//	func remove(_ event:NSEvent) {
//		//		responder.removeValue(forKey:event.eventNumber)
//	}
//}

#endif
