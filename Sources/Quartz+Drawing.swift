
import CoreGraphics

extension Color {
	internal var quartz:CGColorRef {
		switch self.components {
			case let .RGB(r, g, b): return CGColorCreateGenericRGB(CGFloat(r), CGFloat(g), CGFloat(b), CGFloat(alpha))
			case let .Gray(x): return CGColorCreateGenericGray(CGFloat(x), CGFloat(alpha))
		}
	}
}
