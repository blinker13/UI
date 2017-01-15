
import CoreGraphics

public extension Color {
	var quartz:CGColor {
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
