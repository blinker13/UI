
public protocol Container : Component {

	var arrangement:Arrangement { get }
	var distribution:Distribution { get }
	var justify:Alignment { get }
	var padding:Padding { get }

	func construct() -> [Component]
}

public extension Container where Self : Stylable {
	var arrangement:Arrangement { return style.get("arrangement") ?? .vertical }
	var distribution:Distribution { return style.get("distribution") ?? .equal }
	var justify:Alignment { return style.get("justify") ?? .leading }
	var padding:Padding { return style.get("padding") ?? .zero }
}
