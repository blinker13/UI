
import Geometry
import Layout

public class Node : Hashable, Scopable, Stylable, Responder {

	internal typealias Ancestors = TreeIterator<Node>
	internal typealias Identifier = ObjectIdentifier

	internal private(set) weak var parent:Node?
	internal private(set) var element:Element

	internal private(set) var children:[Node] = [] {
		willSet { children.forEach(unmount) }
		didSet { children.forEach(mount) }
	}

	public private(set) var style:Style = .empty
	public var next:Responder? { return parent }

	internal init (with element:Element) {
		self.element = element
	}
}

// MARK: -

public extension Node {

	static func == (left:Node, right:Node) -> Bool {
		return left.scope == right.scope
	}

	var hashValue:Int { return idendifier.hashValue }
	var scope:Scope { return scopable?.scope ?? Scope(self) }
}

// MARK: -

internal extension Node {

	var ancestors:Ancestors {
		return Ancestors(parent) { $0.parent }
	}

	func process(_ event:Event) {
//		guard renderer is Responder else { event.send(to:self) }
//		else { parent?.process(event) }
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
}

// MARK: -

private extension Node {

	var idendifier:Identifier { return Identifier(self) }
	var component:Stateful? { return element as? Stateful }
	var scopable:Scopable? { return element as? Scopable }

	func unmount(child:Node) { child.parent = nil }
	func mount(child:Node) { child.parent = self }
}
