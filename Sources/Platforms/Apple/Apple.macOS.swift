
#if os(OSX)

import AppKit

internal final class Apple {

	static var bounds:NSRect {
		guard let screen = NSScreen.main else { return .zero }

		let vertical = round(screen.frame.height * 0.15)
		let horizontal = round(screen.frame.width * 0.2)
		let rect = screen.frame.insetBy(dx:horizontal, dy:vertical)
		return rect.offsetBy(dx:0, dy:vertical * 0.3)
	}
}

#endif
