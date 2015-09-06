
public enum Canvas {

	public enum Rule {
		case nonzero
		case evenodd
	}

	case save
	case restore

	case compound([Canvas])

	case setFlatness(Float)
	case setLineCap(Line.Cap)
	case setLineJoin(Line.Join)
	case setLineWidth(Line.Width)
//		case setMiterLimit(Float)
//		case setPatternPhase(Size)
	case setBlending(Blending)

	case setTextMatrix(Transform)
	case print(Text)

	case setOpacity(Opacity)
	case setFill(Color)
	case setStroke(Color)
	case transform(Transform)

	case adding([Shape])

	case clearing([Rect])
	case filling(Rule)
	case stroking
}

public extension Canvas {

	init (with canvas:[Canvas]) {
		self = .compound(canvas)
	}

	init (_ canvas:Canvas ...) {
		self = .compound(canvas)
	}
}

extension Canvas : ExpressibleByArrayLiteral {

	public init(arrayLiteral elements:Canvas ...) {
		self = .compound(elements)
	}
}
