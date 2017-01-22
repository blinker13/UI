
#if os(OSX)

import AppKit

public final class QuartzViewController : NSViewController {

	internal let scene:Scene

	internal lazy var renderer:Renderer = {
		return QuartzRenderer(root:self.view.layer!)
	}()

	// MARK: -

	internal init (with scene:Scene) {
		self.scene = scene
		super.init(nibName:nil, bundle:nil)!
	}

	public convenience init (with window:Window) {
		let scene = Scene(with:window)
		self.init(with:scene)
	}

	public convenience init (with component:Component) {
		let window = Window(with:component)
		self.init(with:window)
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
		scene.update(currentSize)
		super.viewWillLayout()
	}

	override func viewDidLayout() {
		view.layer!.isGeometryFlipped = true
		scene.display(with:renderer)
		super.viewDidLayout()
	}

	override func viewWillAppear() {
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
