
import Dispatch

public final class Application {

	public static let shared = Application()

	internal private(set) var keyScene:Scene!

	private let queue:DispatchQueue = .main
	private var scenes:Set<Scene> = []
}

// MARK: -

public extension Application {

	static func run(_ element:Element) {
		let scene = Scene(with:element)
		shared.keyScene = scene
		Apple.start()
	}

	func send<Target, Sender>(_ action:Action<Target, Sender>, completion handler:@escaping (Bool) -> Void) {
		let operation = Action.Operation(action:action, completion:handler)
		queue.async(execute:operation.run)
	}

	func send(_ event:Event) {
		// TODO: is main thread

		switch event {
			case let gesture as Gesture: keyScene.send(gesture)
			default: scenes.forEach { $0.send(event) }
		}
	}

	func terminate() {
		Apple.stop()
	}
}

// MARK: -

private extension Application {

	func deliver<Target, Sender>(_ action:Action<Target, Sender>) {
		if let this = action.target { action.perform(with:this) }
		// TODO: search sender
	}
}
