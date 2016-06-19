
import CoreGraphics
import Canvas

internal extension Color {
	var quartz:CGColor {
		let values = self.components.cgColorComponents + [CGFloat(alpha)]
		return CGColor(colorSpace: self.components.cgColorSpace!, components: values)!
	}
}

private extension Color.Components {

	var cgColorSpace:CGColorSpace? {
		switch self {
			case .rgb: return CGColorSpaceCreateDeviceRGB()
			case .gray: return CGColorSpaceCreateDeviceGray()
		}
	}

	var cgColorComponents:[CGFloat] {
		switch self {
			case let .rgb(r, g, b): return [CGFloat(r), CGFloat(g), CGFloat(b)]
			case let .gray(x): return [CGFloat(x)]
		}
	}
}
