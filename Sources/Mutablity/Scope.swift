
public struct Scope {

	internal let render:() -> [Component]

	internal init (_ render:@escaping() -> [Component]) {
		self.render = render
	}
}
