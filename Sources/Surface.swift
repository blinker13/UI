
public protocol Surface {

	var pre:Composition { get }
	var post:Composition { get }

	func draw(in rect:Rect) -> Composition
}

public extension Surface {
	var pre:Composition { return .save }
	var post:Composition { return .restore }
}

public extension Surface where Self : Visual {

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
