
import Geometry

extension Space : AlignmentRepresentable {
	public var leading:Point { return Point(left, top) }
	public var center:Point { return Point(left + right, top + bottom) }
	public var trailing:Point { return Point(right, bottom) }
}
