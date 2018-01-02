
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

// MARK: -

internal extension CGPoint {
	init (with point:Point) {
		self.x = CGFloat(point.x)
		self.y = CGFloat(point.y)
	}
}

internal extension CGSize {

	init (with size:Size) {
		self.height = CGFloat(size.height)
		self.width = CGFloat(size.width)
	}
}

internal extension CGRect {

	init (with rect:Rect) {
		self.origin = CGPoint(with:rect.origin)
		self.size = CGSize(with:rect.size)
	}
}

internal extension CGAffineTransform {

	init (with transform:Transform) {
		self.a = CGFloat(transform.a)
		self.b = CGFloat(transform.b)
		self.c = CGFloat(transform.c)
		self.d = CGFloat(transform.d)
		self.tx = CGFloat(transform.x)
		self.ty = CGFloat(transform.y)
	}
}

// MARK: -

internal extension Point {

	var cgPoint:CGPoint {
		return CGPoint(with:self)
	}

	init (cg point:CGPoint) {
		self.x = Float(point.x)
		self.y = Float(point.y)
	}
}

internal extension Size {

	var cgSize:CGSize {
		return CGSize(with:self)
	}

	init (cg size:CGSize) {
		self.height = Float(size.height)
		self.width = Float(size.width)
	}
}

internal extension Rect {

	var cgRect:CGRect {
		return CGRect(with:self)
	}

	init (cg rect:CGRect) {
		self.origin = Point(cg:rect.origin)
		self.size = Size(cg:rect.size)
	}
}

internal extension Transform {
	var cgTransform:CGAffineTransform { return CGAffineTransform(with:self) }
}

// MARK: -

internal extension Blending {

	var cgBlending:CGBlendMode {
		switch self {
		case .normal: return .normal
		case .multiply: return .multiply
		case .screen: return .screen
		case .overlay: return .overlay
		case .darken: return .darken
		case .lighten: return .lighten
		case .colorDodge: return .colorDodge
		case .colorBurn: return .colorBurn
		case .softLight: return .softLight
		case .hardLight: return .hardLight
		case .difference: return .difference
		case .exclusion: return .exclusion
		case .hue: return .hue
		case .saturation: return .saturation
		case .color: return .color
		case .luminosity: return .luminosity
		case .clear: return .clear
		case .copy: return .copy
		case .sourceIn: return .sourceIn
		case .sourceOut: return .sourceOut
		case .sourceAtop: return .sourceAtop
		case .destinationOver: return .destinationOver
		case .destinationIn: return .destinationIn
		case .destinationOut: return .destinationOut
		case .destinationAtop: return .destinationAtop
		case .xor: return .xor
		case .plusDarker: return .plusDarker
		case .plusLighter: return .plusLighter
		}
	}
}

internal extension Canvas.Rule {

	var cgFillRule:CGPathDrawingMode {
		switch self {
		case .evenodd: return .eoFill
		case .nonzero: return .fill
		}
	}
}

internal extension Line.Cap {

	var cgLineCap:CGLineCap {
		switch self {
		case .butt: return .butt
		case .round: return .round
		case .square: return .square
		}
	}
}

internal extension Line.Join {

	var cgLineJoin:CGLineJoin {
		switch self {
		case .miter: return .miter
		case .round: return .round
		case .bevel: return .bevel
		}
	}
}

// MARK: -

internal extension Color {

	var cgColor:CGColor {
		let values = self.cgColorComponents + [CGFloat(alpha)]
		return CGColor(colorSpace: self.cgColorSpace!, components: values)!
	}
}

private extension Color {

	var cgColorSpace:CGColorSpace? {
		switch components {
		case .rgb: return CGColorSpaceCreateDeviceRGB()
		case .gray: return CGColorSpaceCreateDeviceGray()
		}
	}

	var cgColorComponents:[CGFloat] {
		switch components {
		case let .rgb(r, g, b): return [CGFloat(r), CGFloat(g), CGFloat(b)]
		case let .gray(x): return [CGFloat(x)]
		}
	}
}
