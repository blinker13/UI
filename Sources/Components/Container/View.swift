
public struct View : Container {

	public var alignment = Alignment.Leading
	public var margin = Offset.zero
	public var width = Size()
	public var height = Size()
	public var isHidden = false

	public var arrangement = Arrangement.Vertical
	public var contentAlignment = Alignment.Leading
	public var distribution = Distribution.Equal
	public var padding = Offset.zero

	private let constructor:() -> [Component]

	// MARK: -

	public init(constructor:() -> [Component]) {
		self.constructor = constructor
	}

	public init(@autoclosure(escaping) components:() -> [Component]) {
		self.init(constructor:components)
	}

	// MARK: -

	public func construct() -> [Component] {
		return constructor()
	}
}