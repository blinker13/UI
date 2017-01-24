
public final class Application {

	public static let shared = Application()

	internal var content:Component?

	private init () {
		
	}
}

public extension Application {

	static func run(_ component:Component) {
		let application = Application.shared
		application.content = component
		application.main()
	}
}
