
#if os(OSX)

import AppKit

public final class AppleViewController : NSViewController {

	internal let scene:Scene

	internal lazy var renderer:Renderer = {
		return AppleRenderer(root:self.view.layer!)
	}()

	internal init (with scene:Scene) {
		self.scene = scene
		super.init(nibName:nil, bundle:nil)!
	}

	public required init?(coder:NSCoder) {
		fatalError()
	}
}


public extension AppleViewController {

	override var preferredMinimumSize:NSSize { return CGSize(with:scene.minimumSize) }
	override var preferredMaximumSize:NSSize { return CGSize(with:scene.maximumSize) }

	override func loadView() {
		let rect = NSRect(origin:.zero, size:AppleWindow.bounds.size)
		let view = NSView(frame:rect)
		view.layer = AppleLayer()
		view.wantsLayer = true
		self.view = view
	}

	override func viewWillLayout() {
		scene.update(currentSize)
		super.viewWillLayout()
	}

	override func viewDidLayout() {
		CATransaction.setDisableActions(true)
		
		scene.display(with:renderer)
		CATransaction.setDisableActions(false)
		super.viewDidLayout()
	}

	override func viewWillAppear() {
		view.layer!.isGeometryFlipped = true
		super.viewWillAppear()
		scene.onStart()
	}

	override func viewDidAppear() {
		super.viewDidAppear()
		scene.onResume()
	}

	override func viewWillDisappear() {
		super.viewWillDisappear()
		scene.onPause()
	}

	override func viewDidDisappear() {
		super.viewDidDisappear()
		scene.onStop()
	}
}

#endif
