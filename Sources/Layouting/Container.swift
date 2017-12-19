
import Geometry

public protocol Container {
	var arrangement:Arrangement { get }
	var distribution:Distribution { get }
	var justify:Alignment { get }
	var padding:Padding { get }
}

// MARK: -

public extension Container {
	func layout(_ items:[Item], in rect:Rect) -> Calculator {
		return Calculator(container:self, items:items, in:rect)
	}
}

// MARK: -

internal extension Container {
	func convert(_ layout:Layout) -> Rect {
		let x = layout[keyPath:arrangement.layoutKey]
		let y = layout[keyPath:arrangement.flipped.layoutKey]
		return Rect(x.start, y.start, x.size, y.size)
	}
}
