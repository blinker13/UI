
public protocol ComponentType {
	var alignment:Alignment { get }
	var margin:Space { get }
	var height:Size { get }
	var width:Size { get }
	var isHidden:Bool { get }
}

// MARK: -

extension ComponentType {
	public var alignment:Alignment { return .Leading }
	public var margin:Space { return Space.zero }
	public var height:Size { return Size() }
	public var width:Size { return Size() }
	public var isHidden:Bool { return false }
}
