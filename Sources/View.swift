
public struct View : Container {

	public var alignment:Alignment = .Leading
	public var margin:Space = .zero

	public var width = Dimension()
	public var height = Dimension()

	public var arrangement:Arrangement = .Vertical
	public var contentAlignment:Alignment = .Leading
	public var distribution:Distribution = .Equal
	public var padding:Space = .zero

	private let constructor:() -> [Component]

	// MARK: -

	public init(constructor:() -> [Component]) {
		self.constructor = constructor
	}
}

// MARK: -

extension View {

	public init(@autoclosure(escaping) components:() -> [Component]) {
		self.init(constructor:components)
	}

	public init(components:Component ...) {
		self.init { return components }
	}

	public func construct() -> [Component] {
		return constructor()
	}
}
