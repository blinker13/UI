
public protocol View : Component, Stylable, Visual {}

public extension View {
	func render(with context:Context) -> [Component] {
		return []
	}
}
