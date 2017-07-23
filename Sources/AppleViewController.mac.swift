
#if os(OSX)

import AppKit

public final class AppleViewController : NSViewController {

	internal let scene:Scene

	internal lazy var renderer:Renderer = {
		return AppleRenderer(root:self.layer)
	}()

	internal init (with scene:Scene) {
		self.scene = scene
		super.init(nibName:nil, bundle:nil)
	}

	public required init? (coder:NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

// MARK: -

public extension AppleViewController {

	override var preferredMinimumSize:NSSize { return CGSize(with:scene.minimumSize) }
	override var preferredMaximumSize:NSSize { return CGSize(with:scene.maximumSize) }

	// MARK: Lifecyle

	override func loadView() {
		let rect = NSRect(origin:.zero, size:Apple.Window.bounds.size)
		view = Apple.View(frame:rect)
	}

//	override func viewWillAppear() {
//		super.viewWillAppear()
//		scene.onStart()
//	}
//
//	override func viewDidAppear() {
//		super.viewDidAppear()
//		scene.onResume()
//	}
//
//	override func viewWillDisappear() {
//		super.viewWillDisappear()
//		scene.onPause()
//	}
//
//	override func viewDidDisappear() {
//		super.viewDidDisappear()
//		scene.onStop()
//	}

	// MARK: Layout

	override func viewWillLayout() {
		layer.contentsScale = view.window?.backingScaleFactor ?? 1
		scene.update(currentSize)
		super.viewWillLayout()
	}

	override func viewDidLayout() {
		scene.display(with:renderer)
		super.viewDidLayout()
	}
}

// MARK: -

private extension AppleViewController {
	var layer:CALayer { return view.layer! }
}

#endif
