
public struct Window : Stylable, Component {

	public let root:Component
	public let style:Style

	public var height:Dimensions { return style.height ?? calculatedHeight }
	public var width:Dimensions { return style.width ?? calculatedWidth }

	public init (with root:Component, style:Style = Style()) {
		(self.root, self.style) = (root, style)
	}

	public func render() -> [Component] {
		return [root]
	}
}

internal extension Window {
	static func wrap(_ component:Component) -> Window {
		return component as? Window ?? Window(with:component)
	}
}

private extension Window {
	var calculatedHeight: Dimensions { return root.height } //TODO: add vertical margin
	var calculatedWidth: Dimensions { return root.width } //TODO: add horizontal margin
}
