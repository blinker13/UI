
import Geometry

public enum Composition {

	public enum Rule {
		case nonzero
		case evenodd
	}

	case save
	case restore

	case compound([Composition])

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

public extension Composition {

	init (with compositions:[Composition]) {
		self = .compound(compositions)
	}

	init (_ compositions:Composition ...) {
		self = .compound(compositions)
	}
}

extension Composition : ExpressibleByArrayLiteral {

	public init(arrayLiteral elements:Composition ...) {
		self = .compound(elements)
	}
}
