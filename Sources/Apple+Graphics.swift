
import CoreGraphics

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

internal extension Composition.Rule {

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
