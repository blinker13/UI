
public final class Scope {

	public typealias Value = Any
	public typealias Update = () -> Void
	public typealias Handle = (Update) -> Void

	internal var handle:Handle?
	internal var value:Value
	internal var hash:Int?

	public init (with value:Value = ()) {
		self.value = value
	}
}

public extension Scope {
	convenience init <ID>(with value:Value = (), identifier:ID) where ID : Hashable {
		self.init(with:value)
		self.hash = identifier.hashValue
	}
}

private extension Scope {
	var identifier:ObjectIdentifier {
		return ObjectIdentifier(self)
	}
}

extension Scope : Hashable {

	public static func == (left:Scope, right:Scope) -> Bool {
		return left.hashValue == right.hashValue
	}

	public var hashValue:Int {
		return hash ?? identifier.hashValue
	}
}

//extension Scope : Listener {
//	public func onEvent(_ event:Event) {
//		for listener in listeners {
//			listener.onEvent(event)
//		}
//	}
//}
