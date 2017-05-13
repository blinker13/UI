
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
		shared.window = Window.wrap(component)
		shared.main()
	}

	static func terminate() {
		shared.exit()
	}
}
