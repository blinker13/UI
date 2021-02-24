
extension Text : Equatable {
	public static func == (left: Text, right: Text) -> Bool {
		left.string == right.string
	}
}

extension Text.Attributes : Equatable {
	public static func == (left: Text.Attributes, right: Text.Attributes) -> Bool {
		left.font == right.font
	}
}

extension Text.Range : Equatable {
	public static func == (left: Text.Range, right: Text.Range) -> Bool {
		left.location == right.location && left.length == right.length
	}
}

extension Text.Run : Equatable {
	public static func == (left: Text.Run, right: Text.Run) -> Bool {
		left.attributes == right.attributes && left.range == right.range
	}
}
