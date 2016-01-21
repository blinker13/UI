
public protocol TextualType : ComponentType {
	var lineBreak:LineBreak { get }
	var textAlignment:Alignment { get }
	var text:TextType { get }
}

// MARK: - Defaults

extension TextualType {
	public var lineBreak:LineBreak { return .TruncateTail }
	public var textAlignment:Alignment { return .Leading }
}
