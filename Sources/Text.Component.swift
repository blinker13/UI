
extension Text : Box, Textual {

	public var style: Style {
		switch self {
			case let .compound(compound): return compound.style
			case let .run(run): return run.style
		}
	}

	public var text: Text {
		return self
	}
}
