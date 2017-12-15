
public final class Application {

	public static let shared = Application()

	var name:String {
		let sequence = path.split(separator:"/")
		let components = sequence.map(String.init)
		return components.last!
	}

	var path:String {
		return CommandLine.arguments.first!
	}

	internal var window:Window?
}

public extension Application {

	static func run(_ element:Element) {
		let window = Window(with:element)
		run(with:window)
	}

	static func run(with window:Window) {
		shared.open(window)
		shared.main()
	}

	static func terminate() {
		shared.exit()
	}
}
