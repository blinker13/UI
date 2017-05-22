
public class Attribute<Kind> {

	public let name:String

	public init (_ name:String) {
		self.name = name
	}
}

internal extension Attribute {
	func styled(_ kind:Kind) -> Style {
		return Style(key:self, value:kind)
	}
}

internal extension Attribute {
	func valued(_ kind:Kind) -> Style.Value {
		return Style.Value(hash:hashValue, raw:kind)
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
		let id = ObjectIdentifier(self)
		return id.hashValue
	}
}
