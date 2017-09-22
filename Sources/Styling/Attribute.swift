
public struct Attribute<Kind> where Kind : Style.Value {
	public let name:String
}

public extension Attribute {
	init (_ name:String) {
		self.name = name
	}
}

extension Attribute : CustomStringConvertible {
	public var description:String { return name }
}

extension Attribute : Equatable {
	public static func == (left:Attribute, right:Attribute) -> Bool {
		return left.name == right.name
	}
}
