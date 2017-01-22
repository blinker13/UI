
public extension Application {

	static func run(_ component:Component) {
		let application = Application.shared
		application.run(with:component)
	}
}
