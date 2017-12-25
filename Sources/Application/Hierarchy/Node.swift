
import Geometry
import Layout

internal class Node : Hashable, Scopable, Stylable, Responder {

	internal typealias Ancestors = TreeIterator<Node>
	internal typealias Identifier = ObjectIdentifier

	internal private(set) weak var parent:Node?
	internal private(set) var style:Style = .empty
	internal private(set) var frame:Rect = .zero
	internal private(set) var element:Element

	internal private(set) var children:[Node] = [] {
		willSet { children.forEach(unmount) }
		didSet { children.forEach(mount) }
	}

	internal var next:Responder? {
		guard let next = parent else { return nil }
		return next.responder ?? next
	}

	internal init (with element:Element) {
		self.element = element
	}
}

// MARK: -

internal extension Node {

	static func == (left:Node, right:Node) -> Bool {
		return left.scope == right.scope
	}

	var ancestors:Ancestors {
		return Ancestors(parent) { $0.parent }
	}

	var hashValue:Int { return idendifier.hashValue }
	var scope:Scope { return scopable?.scope ?? Scope(self) }

	func process(_ event:Event) {
//		guard renderer is Responder else { event.send(to:self) }
//		else { parent?.process(event) }
	}

	func test(_ hit:Point) -> Node? {
		guard bounds.contains(hit) else { return nil }
//		guard isVisible else { return nil }

		for child in children.reversed() {
			let point = hit.converted(to:child.frame)
			if let node = child.test(point) {
				return node
			}
		}

		return self
	}

	func update(with next:Element) {
		defer { self.element = next }
		guard let component = next as? Stateful else { return }
		component.reconcile(with:element)
	}

	func update() -> [Change] {
		let view = element.render()
		let reconciler = Reconciler(with:self)
		children = reconciler.update(view.children)
		style = reconciler.update(view.style)
		return reconciler.results
	}

	func layout(in rect:Rect) -> [Rect] {
		self.frame = rect
		return layout()
	}
}

// MARK: -

private extension Node {

	var bounds:Rect { return Rect(size:frame.size) }
	var idendifier:Identifier { return Identifier(self) }
	var component:Stateful? { return element as? Stateful }
	var responder:Responder? { return element as? Responder }
	var scopable:Scopable? { return element as? Scopable }

	func unmount(child:Node) { child.parent = nil }
	func mount(child:Node) { child.parent = self }

	func layout() -> [Rect] {
		let calculator = Calculator(container:self, in:bounds)
		return calculator.layout(children)
	}
}
