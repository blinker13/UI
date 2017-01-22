
public struct Window : Stylable {

	public let root:Component
	public let style:Style

	public init (with root:Component, style:Style = Style()) {
		(self.root, self.style) = (root, style)
	}
}

extension Window : Component {
	public var height:Dimensions { return style.height ?? calculatedHeight }
	public var width:Dimensions { return style.width ?? calculatedWidth }
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

internal extension Window {
	static func wrap(_ component:Component) -> Window {
		if let window = component as? Window { return window }
		else { return Window(with:component) }
	}
}

private extension Window {

	var page:Page? {
		return root as? Page
	}

	var calculatedHeight: Dimensions {
		return root.height //TODO: add vertical margin
	}

	var calculatedWidth: Dimensions {
		return root.width //TODO: add horizontal margin
	}
}
