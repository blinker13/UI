
#if os(OSX)

import AppKit

public final class QuartzViewController : NSViewController {

	internal let scene:Scene

	internal lazy var renderer:Renderer = {
		return QuartzRenderer(root:self.view.layer!)
	}()

	public init (component:Component) {
		self.scene = Scene(with:component)
		super.init(nibName:nil, bundle:nil)!
	}

	public required init?(coder:NSCoder) {
		fatalError()
	}
}

public extension QuartzViewController {

	override var preferredMinimumSize:NSSize { return CGSize(with:scene.minimumSize) }
	override var preferredMaximumSize:NSSize { return CGSize(with:scene.maximumSize) }

	override func loadView() {
		let rect = NSRect(origin:.zero, size:preferredMinimumSize)
		let view = NSView(frame:rect)
		view.wantsLayer = true
		view.layer = CALayer()
		view.layer!.isGeometryFlipped = true
		self.view = view
	}

	override func viewWillLayout() {
		super.viewWillLayout()
		updateScene()
	}
}

#endif
