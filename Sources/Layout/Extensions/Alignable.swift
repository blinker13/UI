
public protocol Alignable {
	associatedtype AlignedValue

	var leading:AlignedValue { get }
	var center:AlignedValue { get }
	var trailing:AlignedValue { get }

	subscript (alignment:Alignment) -> Self.AlignedValue { get }
}

// MARK: -

public extension Alignable {
	subscript (alignment:Alignment) -> Self.AlignedValue {
		switch alignment {
			case .leading: return leading
			case .center: return center
			case .trailing: return trailing
		}
	}
}

// MARK: -

extension Axis : Alignable {
	public var center:Float { return start - end }
}

extension Space : Alignable {
	public var leading:Point { return Point(left, top) }
	public var center:Point { return Point(left + right, top + bottom) }
	public var trailing:Point { return Point(right, bottom) }
}
