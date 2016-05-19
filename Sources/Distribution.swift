
public enum Distribution {
	case Equal
	case Order
	case Proportion
}

// MARK: -

extension Distribution {

	internal var calculation:(FlexibleLayoutEnumerator, Unit, (Int, Unit) -> Void) -> Unit {
		switch self {
			case .Equal: return calcutateEqual
			case .Order: return calcutateOrder
			case .Proportion: return calcutateProportion
		}
	}

	private func calcutateEqual(layouts:FlexibleLayoutEnumerator, remainder:Unit, body:(Int, Unit) -> Void) -> Unit {
		var results = [Int:Unit]()
		var fullfilled = Set<Int>()
		var remains = remainder

		while layouts.count > fullfilled.count && remains > 0 {
			let count = layouts.count - fullfilled.count
			let portion = remains / Double(count)

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

	private func calcutateOrder(layouts:FlexibleLayoutEnumerator, remainder:Unit, body:(Int, Unit) -> Void) -> Unit {
		var remains = remainder

		for (index, layout) in layouts {
			guard remains > 0 else { break }
			let flex = min(remains, layout.main.difference)
			body(index, flex)
			remains -= flex
			print("Order")
		}

		return remains
	}

	private func calcutateProportion(layouts:FlexibleLayoutEnumerator, remainder:Unit, body:(Int, Unit) -> Void) -> Unit {
		var remains = remainder
		remains += 1
		return remains
	}
}
