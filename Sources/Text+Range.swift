
public extension Text.Range {

	public init (from string:String) {
		self.length = string.characters.count
		self.location = 0
	}
}

extension Text.Range : Collection {

	public var startIndex:Int { return location }
	public var endIndex:Int { return location + length }

	public subscript (index: Int) -> Int {
		precondition(index < endIndex)
		return index + location
	}

	public func index(after index:Int) -> Int {
		precondition(index < endIndex)
		return index + 1
	}
}

extension Text.Range : Equatable {

	public static func == (left:Text.Range, right:Text.Range) -> Bool {
		return left.location == right.location && left.length == right.length
	}
}
