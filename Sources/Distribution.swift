
import Canvas

public enum Distribution {
	case equal
	case order
	case proportion
}

internal extension Distribution {

	var calculation:(FlexibleLayoutEnumerator, Real, (Int, Real) -> Void) -> Real {
		switch self {
			case .equal: return calcutateEqual
			case .order: return calcutateOrder
			case .proportion: return calcutateProportion
		}
	}
}

private extension Distribution {

	func calcutateEqual(_ layouts:FlexibleLayoutEnumerator, remainder:Real, body:(Int, Real) -> Void) -> Real {
		var fullfilled = Set<Int>()
		var results = [Int:Real]()
		var remains = remainder

		while layouts.count > fullfilled.count && remains > 0 {
			let count = layouts.count - fullfilled.count
			let portion = remains / Real(count)

			for (index, layout) in layouts {
				if fullfilled.contains(index) { continue }

				let currentFlex = results[index] ?? 0.0
				var flex = currentFlex + portion

				if flex >= layout.main.difference {
					flex = layout.main.difference
					fullfilled.insert(index)
				}

				remains -= (flex - currentFlex)
				results[index] = flex
			}
		}

		results.forEach(body)
		return remains
	}

	func calcutateOrder(_ layouts:FlexibleLayoutEnumerator, remainder:Real, body:(Int, Real) -> Void) -> Real {
		var remains = remainder

		for (index, layout) in layouts {
			guard remains > 0 else { break }
			let flex = min(remains, layout.main.difference)
			body(index, flex)
			remains -= flex
		}

		return remains
	}

	func calcutateProportion(_ layouts:FlexibleLayoutEnumerator, remainder:Real, body:(Int, Real) -> Void) -> Real {
		var remains = remainder
		remains += 1
		return remains
	}
}
