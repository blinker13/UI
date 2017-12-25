
import Geometry
import Layout

internal class Node : Hashable, Scopable, Container, Item, Renderer {

	internal private(set) weak var parent:Node?

	internal private(set) var element:Element!
	internal private(set) var frame:Rect = .zero

	internal var children:[Node] = [] {
		willSet { children.forEach(unmount) }
		didSet { children.forEach(mount) }
	}

	internal var renderer:Renderer {
		willSet { reconcile(newValue) }
	}

	public init (with renderer:Renderer) {
		self.renderer = renderer
	}
}

// MARK: -

internal extension Node {

	static func == (left:Node, right:Node) -> Bool {
		return left.scope == right.scope
	}

	var hashValue:Int { return identifier.hashValue }
	var scope:Scope { return scopable?.scope ?? .id(identifier) }
	var ancestors:Ancestors { return Ancestors(current:self) }

	var arrangement:Arrangement { return element.arrangement }
	var distribution:Distribution { return element.distribution }
	var justify:Alignment { return element.justify }
	var padding:Padding { return element.padding }

	var alignment:Alignment { return element.alignment }
	var margin:Margin { return element.margin }
	var height:Axis { return element.height }
	var width:Axis { return element.width }

	func layout(in rect:Rect) -> [Rect] {
		defer { self.frame = rect }
		let bounds = Rect(size:rect.size)
		return layout(children, in:bounds)
	}

	func render() -> Element {
		element = renderer.render()
		return element
	}

	func test(_ hit:Point) -> Node? {
		guard bounds.contains(hit) else { return nil }
		guard isVisible else { return nil }

		for child in children.reversed() {
			let point = hit.converted(to:child.frame)
			if let node = child.test(point) {
				return node
			}
		}

//		guard isResponsive else { return nil }
		return self
	}
}

// MARK: -

private extension Node {

	var bounds:Rect { return Rect(size:frame.size) }
	var identifier:ObjectIdentifier { return ObjectIdentifier(self) }
	var scopable:Scopable? { return element as? Scopable }
	var isVisible:Bool { return element.opacity > 0.01 }

	func mount(child:Node) { child.parent = self }
	func unmount(child:Node) { child.parent = nil }

	func reconcile(_ new:Renderer) {
		guard let stateful = new as? Stateful else { return }
		stateful.update(with:renderer)
	}
}
