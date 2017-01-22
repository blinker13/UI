
#if os(iOS)

import UIKit

public final class QuartzViewController : UIViewController {

	internal let scene:Scene

	internal lazy var renderer:Renderer = {
		return QuartzRenderer(root:self.view.layer)
	}()

	internal init (with scene:Scene) {
		self.scene = scene
		super.init(nibName:nil, bundle:nil)
	}

	public required init?(coder:NSCoder) {
		fatalError()
	}
}

public extension QuartzViewController {

	override func loadView() {
		self.view = UIView(frame:.zero)
	}

	override func viewWillLayoutSubviews() {
		super.viewWillLayoutSubviews()
		scene.update(currentSize)
	}

	public override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()
		scene.display(with:renderer)
	}

	override func viewWillAppear(_ animated:Bool) {
		super.viewWillAppear(animated)
		scene.onStart()
	}

	override func viewDidAppear(_ animated:Bool) {
		super.viewDidAppear(animated)
		scene.onResume()
	}

	override func viewWillDisappear(_ animated:Bool) {
		super.viewWillDisappear(animated)
		scene.onPause()
	}

	override func viewDidDisappear(_ animated:Bool) {
		super.viewDidDisappear(animated)
		scene.onStop()
	}
}

#endif
