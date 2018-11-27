
import QuartzCore
import Graphics

internal extension CALayer {

	var node:Node {
		return style![CALayer.nodeKey] as! Node
	}

	convenience init (with node:Node) {
		defer { self.style = [CALayer.nodeKey:node] }
		self.init()
	}

	func insert(_ layer:CALayer, at index:Int) {
		insertSublayer(layer, at:UInt32(index))
	}
}

// MARK: -

private extension CALayer {
	static let nodeKey = String(describing:Node.self)
}
