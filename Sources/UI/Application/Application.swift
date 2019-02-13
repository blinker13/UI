
import Dispatch

public final class Application : Responder {

	internal static let shared = Application()

	internal private(set) var keyScene:Scene?

	private let queue:DispatchQueue = .main
	private var scenes:Set<Scene> = []
}

// MARK: -

public extension Application {

	static func run(_ view:View) {
		let scene = Scene(with:view)
		shared.show(scene)
		shared.main()
	}

	var next:Responder? { return nil }

	func send<Target, Sender>(_ message:@escaping (Target) -> (Sender) -> Void, to target:Target? = nil, from sender:Sender) {
		let action = Action(send:message, to:target, from:sender)
		queue.async(execute:action.perform)
	}

	func send(_ event:Event) {
//		switch event {
//			case let gesture as Gesture: gesture.scenes.send(gesture)
////			case let this as Discrete.Event: send(Node.forward, to:this.target, from:event)
//			default: keyScene.send(event)
//		}
	}

	func terminate() {
		exit()
	}
}

// MARK: -

internal extension Application {

	func focus(_ scene:Scene) {
		precondition(scenes.contains(scene))
		keyScene = scene
	}

	func show(_ scene:Scene) {
		scenes.insert(scene)
		focus(scene)
	}
}
