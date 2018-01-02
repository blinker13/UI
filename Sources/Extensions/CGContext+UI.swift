
import Foundation
import CoreGraphics
import CoreText
import Geometry
import Graphics

internal extension CGContext {

	func draw(_ composition:Canvas) {

		switch composition {
		case .save: saveGState()
		case .restore: restoreGState()

		case let .compound(compositions): compositions.forEach(draw)

		case let .setFlatness(value): setFlatness(CGFloat(value))
		case let .setLineCap(value): setLineCap(value.cgLineCap)
		case let .setLineJoin(value): setLineJoin(value.cgLineJoin)
		case let .setLineWidth(value): setLineWidth(CGFloat(value))
		case let .setBlending(value): setBlendMode(value.cgBlending)

		case let .setTextMatrix(matrix): textMatrix = matrix.cgTransform
		case let .print(text): return //TODO: print(text.attributedString)

		case let .setOpacity(value): setAlpha(CGFloat(value))
		case let .setFill(color): setFillColor(color.cgColor)
		case let .setStroke(color): setStrokeColor(color.cgColor)
		case let .transform(matrix): concatenate(matrix.cgTransform)

		case let .adding(shapes): shapes.forEach(add)
		case let .clearing(rects): rects.forEach(clear)
		case let .filling(rule): drawPath(using:rule.cgFillRule)
		case .stroking: drawPath(using:.stroke)
		}
	}
}

private extension CGContext {

	var framePath:CGPath {
		let bounds = CGRect(x:0, y:0, width:width, height:height)
		return CGPath(rect:bounds, transform:nil)
	}

	func add(_ shape:Shape) {
		shape.path.elements.forEach(add)
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

	func clear(_ rect:Rect) {
		clear(rect.cgRect)
	}

	func print(_ text:NSAttributedString) {

		saveGState()

		translateBy(x:0, y:CGFloat(height))
		scaleBy(x:1, y:-1)

		let range = CFRangeMake(0, text.length)
		let framesetter = CTFramesetterCreateWithAttributedString(text)
		let frame = CTFramesetterCreateFrame(framesetter, range, framePath, nil)
		CTFrameDraw(frame, self)

		restoreGState()
	}
}
