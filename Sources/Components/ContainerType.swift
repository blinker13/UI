
public protocol ContainerType : ComponentType {

	var arrangement:Arrangement { get }
	var contentAlignment:Alignment { get }
	var distribution:Distribution { get }
	var padding:Offset { get }

	func construct() -> [ComponentType]
}

// MARK: -

extension ContainerType {
	public var arrangement:Arrangement { return .Vertical }
	public var contentAlignment:Alignment { return .Leading }
	public var distribution:Distribution { return .Equal }
	public var padding:Offset { return Offset.zero }
}
