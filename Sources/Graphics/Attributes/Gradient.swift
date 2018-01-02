
public struct Gradient : Codable {

	public let components:[Float:Color]

	public init (components:[Float:Color]) {
		self.components = components
	}
}
