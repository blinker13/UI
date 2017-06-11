
extension Text.Run : CustomStringConvertible {
	public var description:String {
		return string
	}
}

extension Text.Run : Equatable {
	public static func == (left:Text.Run, right:Text.Run) -> Bool {
		return left.string == right.string && left.style == right.style
	}
}
