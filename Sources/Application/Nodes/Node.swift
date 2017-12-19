
import Geometry
import Layouting
import Styling

internal typealias Ancestors = AnyIterator<Node>

internal class Node : Stateless, Viewable, Entity {

	internal private(set) weak var parent:Node?
	internal var frame:Rect = .zero

	internal var children:[Node] = [] {
		willSet { children.forEach(unmount) }
		didSet { children.forEach(mount) }
	}

	public init (with element:Element) {
		super.init(initial:())
		self.model = element
	}
}

// MARK: -

internal extension Node {

	static func == (left:Node, right:Node) -> Bool {
		return left.scope == right.scope
	}

	var hashValue:Int {
		return identifier.hashValue
	}

	var scope:Scope {
		let scopee = model as? Scopable
		return scopee?.scope ?? .id(identifier)
	}

	var ancestors:Ancestors {
		// TODO: make generic sequence using key path getter
		var current:Node? = self

		return Ancestors {
			current = current?.parent
			return current
		}
	}

	func layout(in frame:Rect) -> Calculator {
		defer { self.frame = frame }
		return layout(children, in:frame)
	}
}

// MARK: -

// TODO: remove or replcae logic (ugly)
internal extension Array where Element == Node {

	func traced() -> Set<Trace> {
		let iterator = enumerated()
		let traces = iterator.map(traced)
		return Set(traces)
	}

	private func traced(offset:Int, element:Node) -> Trace {
		return Trace(model:element, position:offset, origin:offset)
	}
}

// MARK: -

private extension Node {

	var identifier:ObjectIdentifier {
		return ObjectIdentifier(self)
	}

	func mount(child:Node) {
		child.parent = self
	}

	func unmount(child:Node) {
		child.parent = nil
	}
}

//	var bounds:Rect { return Rect(origin:.zero, size:frame.size) }
//
//	func test(_ hit:Point) -> Node? {
////		guard isVisible else { return nil }
//		guard bounds.contains(hit) else { return nil }
//
//		for child in children.reversed() {
//			let point = hit.converted(to:child.frame)
//			if let node = child.test(point) {
//				return node
//			}
//		}
//
////		guard isResponsive else { return nil }
//		return self
//	}

//// MARK: -
//
//private extension Node {
//	static func wrap(_ element:Element) -> Node {
//		if let node = element as? Node { return node }
//		else { return Node(with:element) }
//	}
//}
