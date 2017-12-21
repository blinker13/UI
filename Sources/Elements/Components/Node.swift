
import Geometry
import Layout

internal typealias Ancestors = AnyIterator<Node>

internal class Node : Stateless, Viewable, Entity {

	internal private(set) weak var parent:Node?

	internal var bounds:Rect { return Rect(size:frame.size) }
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

	var scope:Scope { return scopable?.scope ?? .id(identifier) }
	var hashValue:Int { return identifier.hashValue }

	var ancestors:Ancestors {
		// FIXME: make generic sequence using key path getter
		var current:Node? = self

		return Ancestors {
			current = current?.parent
			return current
		}
	}

	func layout(in frame:Rect) -> [Rect] {
		defer { self.frame = frame }

		let rect = Rect(frame.size)
		return layout(children, in:rect)
	}

	func test(_ hit:Point) -> Node? {
		guard bounds.contains(hit) else { return nil }

		for child in children.reversed() {
			let point = hit.converted(to:child.frame)
			if let node = child.test(point) {
				return node
			}
		}

//		guard isResponsive else { return nil }
		return self
	}

//	func onBegan(_ touches:Set<Touch>, with gesture:Gesture) {
//		print(self, "onBegan ->", touches)
//		// TODO: forward touch event to recognizers
////		parent?.onBegan(touches, with:gesture)
//	}
//
//	func onMoved(_ touches:Set<Touch>, with gesture:Gesture) {
//		print(self, "onMoved ->", touches)
////		parent?.onMoved(touches, with:gesture)
//	}
//
//	func onEnded(_ touches:Set<Touch>, with gesture:Gesture) {
//		print(self, "onEnded ->", touches)
////		parent?.onEnded(touches, with:gesture)
//	}
//
//	func onCancelled(_ touches:Set<Touch>, with gesture:Gesture) {
//		print(self, "onCancelled ->", touches)
////		parent?.onCancelled(touches, with:gesture)
//	}
}

// MARK: -

private extension Node {

	var identifier:ObjectIdentifier { return ObjectIdentifier(self) }
	var scopable:Scopable? { return model as? Scopable }

	func mount(child:Node) {
		child.parent = self
	}

	func unmount(child:Node) {
		child.parent = nil
	}
}
