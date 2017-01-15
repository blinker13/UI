
#if os(iOS)

import UIKit

internal extension Color {
	var uiColor:UIColor {
		return UIColor(cgColor:quartz)
	}
}

#endif
