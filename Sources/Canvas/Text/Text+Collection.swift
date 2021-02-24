
extension Text.Range : Collection {

	public var startIndex: Int { location }
	public var endIndex: Int { location + length }

	public subscript (index: Int) -> Int {
		precondition(index < endIndex)
		return index + location
	}

	public func index(after index: Int) -> Int {
		precondition(index < endIndex)
		return index + 1
	}
}

extension Text.Run : Collection {

	public var startIndex: Int { range.startIndex }
	public var endIndex: Int { range.endIndex }

	public subscript (index: Int) -> Int {
		return range[index]
	}

	public func index(after index: Int) -> Int {
		return range.index(after: index)
	}
}
