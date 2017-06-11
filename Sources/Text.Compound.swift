
extension Text.Compound : CustomStringConvertible {

	public var description:String {
		let components = runs.map { $0.description }
		return components.joined(separator:separator)
	}
}

extension Text.Compound : Equatable {
	public static func == (left:Text.Compound, right:Text.Compound) -> Bool {
		return left.separator == right.separator && left.style == right.style && left.runs == right.runs
	}
}
