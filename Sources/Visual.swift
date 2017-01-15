
public typealias Opacity = Float

public protocol Visual : Component {
	var background:Color? { get }
	var border:Border? { get }
	var color:Color { get }
	var opacity:Opacity { get }
	var shadow:Shadow? { get }
}

public extension Visual where Self : Stylable {
	var background:Color? { return style.get("background") }
	var border:Border? { return style.get("border") }
	var color:Color { return style.get("color") ?? Color.black }
	var opacity:Opacity { return style.get("opacity") ?? 1.0 }
	var shadow:Shadow? { return style.get("shadow") }
}

public extension Style {
	static func background(_ color:Color) -> Style { return Style(key:"background", value:color) }
	static func border(_ border:Border) -> Style { return Style(key:"border", value:border) }
	static func color(_ color:Color) -> Style { return Style(key:"color", value:color) }
	static func opacity(_ opacity:Opacity) -> Style { return Style(key:"opacity", value:opacity) }
	static func shadow(_ shadow:Shadow) -> Style { return Style(key:"shadow", value:shadow) }
}
