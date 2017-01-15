
extension Text : Equatable {
	public static func == (left:Text, right:Text) -> Bool {
		return left.string == right.string
	}
}

extension Text.Attributes : Equatable {
	public static func == (left:Text.Attributes, right:Text.Attributes) -> Bool {
		return left.font == right.font
	}
}

extension Text.Range : Equatable {
	public static func == (left:Text.Range, right:Text.Range) -> Bool {
		return left.location == right.location && left.length == right.length
	}
}

extension Text.Run : Equatable {
	public static func == (left:Text.Run, right:Text.Run) -> Bool {
		return left.attributes == right.attributes && left.range == right.range
	}
}
