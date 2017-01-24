
public final class Application {
	public static let shared = Application()
	internal var window:Window?
}

public extension Application {

	static func run(_ component:Component) {
		shared.window = Window.wrap(component)
		shared.main()
	}
}
