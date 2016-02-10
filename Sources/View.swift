
import Canvas

public struct View : Container {

	public var align = Alignment.Leading
	public var margin = Space.zero
	public var width = Size()
	public var height = Size()

	public var alignment = Alignment.Leading
	public var arrangement = Arrangement.Vertical
	public var distribution = Distribution.Equal
	public var padding = Space.zero

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
