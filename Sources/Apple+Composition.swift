
import CoreGraphics

internal extension CGContext {

	func draw(_ composition:Composition) {
		composition.actions.forEach(apply)
	}
}

private extension CGContext {

	func apply(_ action:Composition.Action) {

		switch action {
			case .save: saveGState()
			case .restore: restoreGState()

			case let .setFlatness(value): setFlatness(CGFloat(value))
			case let .setLineCap(value): setLineCap(value.cgLineCap)
			case let .setLineJoin(value): setLineJoin(value.cgLineJoin)
			case let .setLineWidth(value): setLineWidth(CGFloat(value))
			case let .setBlending(value): setBlendMode(value.cgBlending)

			case let .setTextMatrix(matrix): textMatrix = matrix.cgTransform

			case let .setOpacity(value): setAlpha(CGFloat(value))
			case let .setFillColor(color): setFillColor(color.cgColor)
			case let .setStrokeColor(color): setStrokeColor(color.cgColor)
			case let .transform(matrix): concatenate(matrix.cgTransform)

			case let .addShape(shape): add(shape.path)

			case let .clear(rect): clear(rect.cgRect)
			case let .draw(rule): drawPath(using:rule.cgDrawRule)
			case let .fill(rule): drawPath(using:rule.cgFillRule)
			case .stroke: drawPath(using:.stroke)
		}
	}

	func add(_ path:Path) {
		path.elements.forEach(add)
	}

	func add(_ element:Path.Element) {

		switch element {
			case let .move(to): move(to:to.cgPoint)
			case let .line(to): addLine(to:to.cgPoint)
			case let .quadCurve(to, cp): addQuadCurve(to:to.cgPoint, control:cp.cgPoint)
			case let .cubicCurve(to, cp1, cp2): addCurve(to:to.cgPoint, control1:cp1.cgPoint, control2:cp2.cgPoint)
			case .close: closePath()
		}
	}
}
