
import Dispatch

public final class Application {

	public static let shared = Application()

	internal let queue:DispatchQueue = .main
	internal private(set) var keyWindow:Window!
}

// MARK: -

public extension Application {

	static func run(_ element:Element) {
		let window = Window(with:element)
		run(with:window)
	}

	static func run(with window:Window) {
		shared.keyWindow = window
		Apple.start()
	}

	static func terminate() {
		Apple.stop()
	}
}
