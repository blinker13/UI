
import CoreGraphics

internal extension Color {

	var quartz:CGColorRef {
		let values = self.components.cgColorComponents + [CGFloat(alpha)]
		return CGColorCreate(self.components.cgColorSpace, values)!
	}
}

private extension Color.Components {

	var cgColorSpace:CGColorSpace? {
		switch self {
			case .RGB: return CGColorSpaceCreateDeviceRGB()
			case .Gray: return CGColorSpaceCreateDeviceGray()
		}
	}

	var cgColorComponents:[CGFloat] {
		switch self {
			case let .RGB(r, g, b): return [CGFloat(r), CGFloat(g), CGFloat(b)]
			case let .Gray(x): return [CGFloat(x)]
		}
	}
}
