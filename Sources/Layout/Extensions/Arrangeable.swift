
public protocol Arrangable {
	associatedtype ArrangedValue

	var horizontal:ArrangedValue { get }
	var vertical:ArrangedValue { get }

	subscript (arrangement:Arrangement) -> Self.ArrangedValue { get }
}

// MARK: -

public extension Arrangable {
	subscript (arrangement:Arrangement) -> Self.ArrangedValue {
		switch arrangement {
			case .horizontal: return horizontal
			case .vertical: return vertical
		}
	}
}

// MARK: -

extension Point : Arrangable {
	public var horizontal:Float { return x }
	public var vertical:Float { return y }
}

extension Size : Arrangable {
	public var horizontal:Float { return width }
	public var vertical:Float { return height }
}

extension Rect : Arrangable {
	public var horizontal:Axis { return Axis(from:origin.x, to:size.width) }
	public var vertical:Axis { return Axis(from:origin.y, to:size.height) }
}

extension Space : Arrangable {
	public typealias ArrangedValue = Axis
}

