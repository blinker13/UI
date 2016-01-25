
public protocol TextComponent : Component {
	var lineBreak:LineBreak { get }
	var textAlignment:Alignment { get }
	var text:Text { get }
}

// MARK: -

extension TextComponent {
	public var lineBreak:LineBreak { return .TruncateTail }
	public var textAlignment:Alignment { return .Leading }
}
