
import Geometry

public protocol Container {
	var arrangement:Arrangement { get }
	var distribution:Distribution { get }
	var justify:Alignment { get }
	var padding:Padding { get }
}

// MARK: -

public extension Container {

	func layout(_ items:[Item], in rect:Rect) -> [Rect] {
		let calculator = Calculator(container:self, in:rect)
		let layouts:[Layout] = calculator.prepare(items)
		while calculator.distribute(layouts) { continue }
		return layouts.map(calculator.finalize)
	}
}
