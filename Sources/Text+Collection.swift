
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

extension Text.Run : Collection {

	public var startIndex:Int { return range.startIndex }
	public var endIndex:Int { return range.endIndex }

	public subscript (index: Int) -> Int {
		return range[index]
	}

	public func index(after index:Int) -> Int {
		return range.index(after:index)
	}
}
