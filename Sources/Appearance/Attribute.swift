
public class Attribute<Kind> {

	public let name:String

	public init (_ name:String) {
		self.name = name
	}
}

public extension Attribute {

	public var key:Style.Key {
		return ObjectIdentifier(self)
	}
}

internal extension Attribute {
	func styled(_ value:Kind) -> Style {
		return Style(attribute:self, raw:value)
	}
}

extension Attribute : CustomStringConvertible {

	public var description:String {
		return name
	}
}

extension Attribute : Hashable {

	public static func == (left:Attribute, right:Attribute) -> Bool {
		return left.hashValue == right.hashValue
	}

	public var hashValue:Int {
		return key.hashValue
	}
}
