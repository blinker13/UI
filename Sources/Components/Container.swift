
public protocol Container : Component {

	var arrangement:Arrangement { get }
	var contentAlignment:Alignment { get }
	var distribution:Distribution { get }
	var padding:Space { get }

	func construct() -> [Component]
}

// MARK: -

extension Container {
	public var arrangement:Arrangement { return .Vertical }
	public var contentAlignment:Alignment { return .Leading }
	public var distribution:Distribution { return .Equal }
	public var padding:Space { return Space.zero }
}
