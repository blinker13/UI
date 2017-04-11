
public struct Composition {

	public enum Action {

		case save
		case restore

		case setFlatness(Float)
		case setLineCap(Line.Cap)
		case setLineJoin(Line.Join)
		case setLineWidth(Line.Width)
//		case setMiterLimit(Float)
//		case setPatternPhase(Size)
		case setBlending(Blending)

		case setTextMatrix(Transform)

		case setOpacity(Opacity)
		case setFillColor(Color)
		case setStrokeColor(Color)
		case transform(Transform)

		case addShape(Shape)

		case clear(Rect)
		case draw(Rule)
		case fill(Rule)
		case stroke
	}

	public enum Rule {
		case nonZero
		case evenOdd
	}

	public let actions:[Action]
}

public extension Composition {

	init (with actions:[Action]) {
		self.actions = actions
	}

	init (_ actions:Action ...) {
		self.actions = actions
	}

	init (action:Action) {
		self.actions = [action]
	}

	init (with compositions:[Composition]) {
		self.actions = compositions.flatMap {
			$0.actions
		}
	}

	init (_ compositions:Composition ...) {
		self.init(with:compositions)
	}
}

internal extension Composition {
	static var empty = Composition(actions:[])
}

extension Composition : ExpressibleByArrayLiteral {

	public init(arrayLiteral elements:Action ...) {
		self.actions = elements
	}
}
