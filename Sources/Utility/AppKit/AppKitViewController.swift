
#if os(OSX)

import AppKit

public final class AppKitViewController : NSViewController {

	#warning("add renderer")
	private let scene:Scene

	public init (with scene:Scene) {
		(self.scene) = (scene)
		super.init(nibName:nil, bundle:nil)
	}

	public required init? (coder:NSCoder) {
		fatalError()
	}
}

#endif
