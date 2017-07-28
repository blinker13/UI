
public struct Scope {
	internal typealias Update = () -> Void
	internal typealias Handle = (Update) -> Void
	internal let render:(@escaping Handle) -> [Component]
}

internal extension Scope {

	init (_ render:@escaping(@escaping Handle) -> [Component]) {
		self.render = render
	}
	
	init (_ render:@escaping() -> [Component]) {
		self.render = { _ in return render() }
	}
}
