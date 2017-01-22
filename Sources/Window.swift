
public struct Window : Stylable {

	public let root:Component
	public let style:Style

	public init (with root:Component, style:Style = Style()) {
		(self.root, self.style) = (root, style)
	}
}

extension Window : Page {

//	public func compose(with context: Context) -> Component {
	public func compose() -> Component {
		return root
	}

	public func onStart() { page?.onStart() }
	public func onResume() { page?.onResume() }
	public func onPause() { page?.onPause() }
	public func onStop() { page?.onStop() }
}

private extension Window {
	var page:Page? { return root as? Page }
}
