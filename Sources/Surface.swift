
public protocol Surface {

	var pre:Composition { get }
	var post:Composition { get }

	func draw(in rect:Rect) -> Composition
}

public extension Surface where Self : Visual {

	var pre:Composition {
		return Composition(
			.setStrokeColor(tint),
			.setFillColor(tint),
			.save
		)
	}

	var post:Composition {
		return Composition(
			.restore
		)
	}
}
