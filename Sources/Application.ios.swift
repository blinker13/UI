
#if os(iOS)

import UIKit

public final class Application {

	public static let shared = Application()

	fileprivate let app = UIApplication.shared

	private init () {

	}
}

internal extension Application {

	func run(with windows:Window) {
		
	}
}
	
#endif
