
public protocol Surface : View {

	var pre:Composition { get }
	var post:Composition { get }

	func draw(in rect:Rect) -> Composition
}

public extension Surface {

	var pre:Composition {
		return Composition(
			.setStroke(tint),
			.setFill(tint),
			.save
		)
	}

	var post:Composition {
		return .restore
	}
}
