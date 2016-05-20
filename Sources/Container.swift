
public struct Content {

	public let alignment:Alignment
	public let arrangement:Arrangement
	public let distribution:Distribution

	// MARK: -

	public init(alignment:Alignment = .Leading, arrangement:Arrangement = .Vertical, distribution:Distribution = .Equal) {
		(self.alignment, self.arrangement, self.distribution) = (alignment, arrangement, distribution)
	}
}

// MARK: -

public protocol Containment : Component {
	var content:Content { get }
	var padding:Space { get }
}

// MARK: -

public protocol Container : Containment {
	func construct() -> [Component]
}
