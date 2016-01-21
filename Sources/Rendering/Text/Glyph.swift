
public struct Glyph {

	public let character:Character
	public let color:Color
	public let font:Font

	// MARK: -

	public init(character:Character, color:Color = .black, font:Font) {
		(self.character, self.color, self.font) = (character, color, font)
	}
}
