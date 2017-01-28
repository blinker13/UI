
public struct Window : Stylable, Page {

	public let root:Component
	public let style:Style

	public var height:Dimensions { return style.height ?? calculatedHeight }
	public var width:Dimensions { return style.width ?? calculatedWidth }

	public init (with root:Component, style:Style = Style()) {
		(self.root, self.style) = (root, style)
	}

	public func onStart() { page?.onStart() }
	public func onResume() { page?.onResume() }
	public func onPause() { page?.onPause() }
	public func onStop() { page?.onStop() }

	public func construct() -> [Component] {
		return [root]
	}
}

internal extension Window {
	static func wrap(_ component:Component) -> Window {
		return component as? Window ?? Window(with:component)
	}
}

private extension Window {
	var page:Page? { return root as? Page }
	var calculatedHeight: Dimensions { return root.height } //TODO: add vertical margin
	var calculatedWidth: Dimensions { return root.width } //TODO: add horizontal margin
}
