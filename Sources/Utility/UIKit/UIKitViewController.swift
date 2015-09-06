
#if os(iOS)

import UIKit

public final class UIKitViewController : UIViewController {

	internal let scene:Scene

	// MARK: -

	internal init (with scene:Scene) {
		(self.scene) = (scene)
		super.init(nibName:nil, bundle:nil)
	}

	public required init? (coder:NSCoder) {
		fatalError()
	}
}

#endif
