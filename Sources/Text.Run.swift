
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

extension Text.Run : Equatable {
	public static func == (left:Text.Run, right:Text.Run) -> Bool {
		return left.range == right.range && left.style == right.style
	}
}
