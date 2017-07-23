
public final class Application {

	public static let shared = Application()

	var name:String {
		let sequence = path.characters.split(separator:"/")
		let components = sequence.map(String.init)
		return components.last!
	}

	var path:String {
		return CommandLine.arguments.first!
	}

	internal var window:Window?
}

public extension Application {

	static func run(_ component:Component) {
		let scene = Scene(with:component)
		run(with:scene)
	}

	static func run(with scene:Scene) {
		let window = Window(with:scene)
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
