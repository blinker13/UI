
internal final class Hash : Hashable {

	static func == (left:Hash, right:Hash) -> Bool {
		return left.hashValue == right.hashValue
	}

	var hashValue:Int {
		let id = ObjectIdentifier(self)
		return id.hashValue
	}
}
