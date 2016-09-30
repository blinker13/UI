
import Geometry

public protocol Container : Component, Containment {
	func construct() -> [Component]
}

public extension Component where Self : Containment {
	var arrangement:Arrangement { return style["arrangement"] as? Arrangement ?? .vertical }
	var distribution:Distribution { return style["distribution"] as? Distribution ?? .equal }
	var justify:Alignment { return style["justify"] as? Alignment ?? .leading }
	var padding:Space { return style["padding"] as? Space ?? Space() }
}
