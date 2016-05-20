
public protocol Container : Component, Containment {
	func construct() -> [Component]
}

// MARK: -

extension Container {
	public var arrangement:Arrangement { return style["arrangement"] as? Arrangement ?? .Vertical }
	public var distribution:Distribution { return style["distribution"] as? Distribution ?? .Equal }
	public var justify:Alignment { return style["justify"] as? Alignment ?? .Leading }
	public var padding:Space { return style["padding"] as? Space ?? Space() }
}
