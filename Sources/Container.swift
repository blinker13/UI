
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

public extension Style {
	static func arrangement(_ alignment:Arrangement) -> Style { return Style(key:"arrangement", value:arrangement) }
	static func distribution(_ distribution:Distribution) -> Style { return Style(key:"distribution", value:distribution) }
	static func justify(_ justify:Alignment) -> Style { return Style(key:"justify", value:justify) }
	static func padding(_ padding:Padding) -> Style { return Style(key:"padding", value:padding) }
}
