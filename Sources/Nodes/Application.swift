
import Dispatch

public final class Application : Responder {

	internal static let shared = Application()

	internal private(set) var keyScene:Scene?

	private let queue:DispatchQueue = .main
	private var scenes:Set<Scene> = []
}

// MARK: -

public extension Application {

	static func run(_ element:Element) {
		let scene = Scene(with:element)
		shared.show(scene)
		shared.main()
	}

	var next:Responder? {
		return nil
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
