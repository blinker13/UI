
public final class Node {

	public typealias Update = () -> Void
	public typealias Handle = (Update) -> Void

//	internal typealias Render = (@escaping Handle) -> [Element]
//
//	internal let render:Render

	internal weak var parent:Node?
	internal var element:Element
	internal var children:[Node] = []
	internal var frame:Rect = .zero

	internal init (with element:Element) {
		self.element = element
	}
}

internal extension Node {

	var ancestors:Ancestors {
		return Ancestors(with:self)
	}

	internal var bounds:Rect {
		return Rect(origin:.zero, size:frame.size)
	}

	var isRoot:Bool {
		return parent == nil
	}

	func test(_ hit:Point) -> Node? {
		guard isVisible else { return nil }
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

	func render(with handle:Scope.Handle) -> [Element] {

		return element.children
	}
}

extension Node : Hashable {

	public static func == (left:Node, right:Node) -> Bool {
		return left.hashValue == right.hashValue
	}

	public var hashValue:Int {
		let identifier = ObjectIdentifier(self)
		return identifier.hashValue
	}
}

private extension Node {
	var isVisible:Bool { return visable?.isVisible ?? false }
//	var isResponsive:Bool { return !listeners.isEmpty }
	var visable:Visable? { return element as? Visable }
}
