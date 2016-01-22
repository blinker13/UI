
public struct Glyph : Equatable {

	public let character:Character
	public let color:Color
	public let font:Font

	// MARK: -

	public init(character:Character, color:Color = .black, font:Font) {
		(self.character, self.color, self.font) = (character, color, font)
	}
}

// MARK: -

public func == (left:Glyph, right:Glyph) -> Bool {
	return (left.character == right.character && left.color == right.color && left.font == right.font)
}
