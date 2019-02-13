
import Geometry
import Runtime

public final class Scene : Node {

	private var transaction = Transaction()

	internal init (with view:View) {
		super.init(with:view)
		update(self)
	}
}

// MARK: -

internal extension Scene {

//	var minimum:Size { return Size(width.min, height.min) }
//	var maximum:Size { return Size(width.max, height.max) }

	func flush() -> Transaction.Iterator {
		return transaction.makeIterator()
	}

	func update(_ node:Node) {
		transaction.commit(node)
	}
}
