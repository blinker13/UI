
public enum Distribution : String, Codable {
	case proportional
	case ordered
	case equal
}

// MARK: -

internal extension Distribution {

	func calculate(for layouts:[Layout], with remains:Float) -> [Float] {

		switch self {
			case .proportional: return proportion(for:layouts, with:remains)
			case .ordered: return layouts.map(setEqualDistribution)
			case .equal: return Array(repeating:1.0/2, count:2)
		}
	}
}

// MARK: -

private extension Distribution {

	func proportion(for layouts:[Layout], with remains:Float) -> [Float] {
//		let flexibleMainSizes = layouts.map(filterFlexibleMainSize)
		return []
	}

	func setEqualDistribution(layout:Layout) -> Float {
		return layout.main.isFlexible ? 1.0 : 0.0
	}
}

//private extension Distribution {
//
//	func calcutateEqual(_ layouts:FlexibleLayoutEnumerator, remainder:Float, body:(Int, Float) -> Void) -> Float {
//		var fullfilled = Set<Int>()
//		var results = [Int:Float]()
//		var remains = remainder
//
//		while layouts.count > fullfilled.count && remains > 0 {
//			let count = layouts.count - fullfilled.count
//			let portion = remains / Float(count)
//
//			for (index, layout) in layouts {
//				if fullfilled.contains(index) { continue }
//
//				let currentFlex = results[index] ?? 0.0
//				var flex = currentFlex + portion
//
//				if flex >= layout.main.difference {
//					flex = layout.main.difference
//					fullfilled.insert(index)
//				}
//
//				remains -= (flex - currentFlex)
//				results[index] = flex
//			}
//		}
//
//		results.forEach { (arg) in
//			let (key, value) = arg
//			body(key, value)
//		}
//		return remains
//	}
//
//	func calcutateOrder(_ layouts:FlexibleLayoutEnumerator, remainder:Float, body:(Int, Float) -> Void) -> Float {
//		var remains = remainder
//
//		for (index, layout) in layouts {
//			guard remains > 0 else { break }
//			let flex = min(remains, layout.main.difference)
//			body(index, flex)
//			remains -= flex
//		}
//
//		return remains
//	}
//
//	func calcutateProportion(_ layouts:FlexibleLayoutEnumerator, remainder:Float, body:(Int, Float) -> Void) -> Float {
//		var remains = remainder
//		remains += 1
//		return remains
//	}
//}

